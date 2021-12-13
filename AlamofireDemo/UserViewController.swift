//
//  UserViewController.swift
//  AlamofireDemo
//
//  Created by Bala Krishna on 12/12/21.
//  Copyright © 2021 Bala Krishna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UserViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.Heros.count
        return self.employeeId_Array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTblView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        cell.nameLbl.text = self.employeeId_Array[indexPath.row]

        return cell
        
    }
    

    @IBOutlet weak var userTblView: UITableView!
    var Heros = [HeroStatus]()
    //var Heros: [HeroStatus] = []
    
    var employeeName_Array = [String]()
    var employeeId_Array = [String]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.userTblView.rowHeight = UITableViewAutomaticDimension
        self.userTblView.rowHeight = 70
        self.userTblView.delegate = self
        self.userTblView.dataSource = self
        self.userTblView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        fetchUserDtat()
    }

    
    func fetchUserDtat() {
        
        
        let myUrl = "http://dummy.restapiexample.com/api/v1/employees"
        Alamofire.request(myUrl, method: .get).responseJSON { (myResponse) in
            switch myResponse.result {
            case .success:
                print(myResponse.result)
                let result = try? JSON(data: myResponse.data!)
                print(result)
               // print(result![data])
                
                let resultararay = result!["data"]
                self.employeeName_Array.removeAll()
                self.employeeId_Array.removeAll()
                for i in resultararay.arrayValue{
                    print(i)
                    
                    let employee_Name = i["employee_name"].stringValue
                    self.employeeName_Array.append(employee_Name)
                    
                    let employee_Id = i["employee_salary"].stringValue
                    self.employeeId_Array.append(employee_Id)
                    
                    

                    
                }
                
                break
                
            case .failure:
                print(myResponse.error!)
                break
            }
            
        }
        
        
      
//
//
//        Alamofire.request("http://dummy.restapiexample.com/api/v1/employees").responseJSON(completionHandler: { (response) in
//
//            switch response.result {
//            case .success(let value):
//               print("sucess")
//               let json = JSON(value)
//                print(json)
//               //let data = json["id"]
//
//               let d = json["data"]
//                print(d)
//
//
//
//
//               d.array?.forEach({ (user) in
//
//                //let id = HeroStatus(id: id["id"].intValue, localized_name: id["localized_name"].stringValue, primary_attr: id["primary_attr"].stringValue, attack_type: id["attack_type"].stringValue, legs: id["legs"].intValue, img: id["img"].stringValue)
//
//                let user = HeroStatus(id: user["id"].stringValue, employee_name: user["employee_name"].stringValue, employee_salary: user["employee_salary"].stringValue, employee_age: user["employee_age"].stringValue)
//
//                self.Heros.append(user)
//
//
//               })
//
//
//
//            case .failure(let error):
//                self.userTblView.reloadData()
//                print(error.localizedDescription)
//
//
//
//
//
//
//            }
//
//
//
//
//        })
      
        
        
    }
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
