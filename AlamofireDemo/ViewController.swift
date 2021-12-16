//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Bala Krishna on 12/12/21.
//  Copyright © 2021 Bala Krishna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeId_Array.count
       // return self.employeeName_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTblView.dequeueReusableCell(withIdentifier: "mycell") as! DataTableViewCell
        cell.name_Lbl.text = employeeName_Array[indexPath.row]
        cell.salary_Lbl.text = employeeSalary_Array[indexPath.row]
        cell.id_Lbl.text = employeeId_Array[indexPath.row]
        cell.Age_Lbl.text = employeeAge_Array[indexPath.row]
        
//        let imageName = employee_ImagesArray[indexPath.row]
//        cell.img_View?.image = UIImage(named: imageName)


        guard let receiveImage = try? Data(contentsOf: URL(string: employee_ImagesArray[indexPath.row])!)
            else {
                
            return cell
        }
        cell.img_View?.image = UIImage(data: receiveImage)
        
        
//
//        let urlString = "https://api.opendota.com/"+(employee_ImagesArray.img)!
//        let  url = URL(string: urlString!)
//
//        cell.img_View.downloaded(from: url)
        
    

        
       // cell.textLabel?.text = employeeId_Array[indexPath.row]
        //cell.detailTextLabel?.text = employeeName_Array[indexPath.row]
        return cell
        
    }
    
   
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.getEmployeeName = employeeName_Array[indexPath.row]
        vc?.getEmployeeName1 = employeeId_Array[indexPath.row]
        vc?.getEmployeeName2 = employeeAge_Array[indexPath.row]
        vc?.getEmployeeName3 = employeeSalary_Array[indexPath.row]
        vc?.getEmployeeName4 = employee_ImagesArray[indexPath.row]
        
        
        
        self.navigationController?.pushViewController(vc!, animated: true)


    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0)
        UIView.animate(withDuration: 1.0, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)

        }, completion: nil)
    }
    
    
    

    
    var employeeName_Array = [String]()
    var employeeSalary_Array = [String]()
    var employeeId_Array = [String]()
    var employeeAge_Array = [String]()
    
    var employee_ImagesArray = [String]()
    
    
    var valueToPass:String!


    @IBOutlet weak var userTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "HOME"
        self.userTblView.delegate = self
        self.userTblView.dataSource = self
        self.userTblView.rowHeight = 250
        fetchUserDtat()

    }
    func fetchUserDtat() {
        //https://api.opendota.com/api/heroStats
        


        let myUrl = "https://reqres.in/api/users?page=2"
        Alamofire.request(myUrl, method: .get).responseJSON { (myResponse) in
            switch myResponse.result {
            case .success:
                print(myResponse.result)
                let result = try? JSON(data: myResponse.data!)
                print(result)
                // print(result![data])

                
                //let resultararay = result!
                let resultararay = result!["data"]

                
                self.employeeName_Array.removeAll()
                self.employeeId_Array.removeAll()
                self.employeeSalary_Array.removeAll()
                self.employee_ImagesArray.removeAll()

                for i in resultararay.arrayValue{
                    print(i)

                    let employee_Name = i["first_name"].stringValue
                    self.employeeName_Array.append(employee_Name)

                    let employee_salary = i["last_name"].stringValue
                    self.employeeSalary_Array.append(employee_salary)

                    let employee_Id = i["id"].stringValue
                    self.employeeId_Array.append(employee_Id)

                    let employee_age = i["email"].stringValue
                    self.employeeAge_Array.append(employee_age)
                    
                    
                    let employee_image = i["avatar"].stringValue
                    self.employee_ImagesArray.append(employee_image)
                    
            


                }
                self.userTblView.reloadData()

                break

            case .failure:
                print(myResponse.error!)
                break
            }

        }

    }
    
        
//
//        let myUrl = "http://dummy.restapiexample.com/api/v1/employees"
//        Alamofire.request(myUrl, method: .get).responseJSON { (myResponse) in
//            switch myResponse.result {
//            case .success:
//                print(myResponse.result)
//                let result = try? JSON(data: myResponse.data!)
//                print(result)
//                // print(result![data])
//
//                let resultararay = result!["data"]
//                self.employeeName_Array.removeAll()
//                self.employeeId_Array.removeAll()
//                for i in resultararay.arrayValue{
//                    print(i)
//
//                    let employee_Name = i["employee_name"].stringValue
//                    self.employeeName_Array.append(employee_Name)
//
//                    let employee_salary = i["employee_salary"].stringValue
//                    self.employeeSalary_Array.append(employee_salary)
//
//                    let employee_Id = i["id"].stringValue
//                    self.employeeId_Array.append(employee_Id)
//
//                    let employee_age = i["employee_age"].stringValue
//                    self.employeeAge_Array.append(employee_age)
//
//
//
//
//
//                }
//                self.userTblView.reloadData()
//
//                break
//
//            case .failure:
//                print(myResponse.error!)
//                break
//            }
//
//        }
//
//    }
    
    
}

