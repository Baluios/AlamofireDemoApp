//
//  DetailViewController.swift
//  AlamofireDemo
//
//  Created by Bala Krishna on 13/12/21.
//  Copyright © 2021 Bala Krishna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ShowParticular_Lbl: UILabel!
    
    var getEmployeeName:String = ""
    var getEmployeeName1:String = ""
    var getEmployeeName2:String = ""
    var getEmployeeName3:String = ""

    
    @IBOutlet weak var empId: UILabel!
    
    @IBOutlet weak var emisalary_Lbl: UILabel!
    @IBOutlet weak var empAge_Lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ShowParticular_Lbl.text = getEmployeeName
        self.empId.text = getEmployeeName1
        self.empAge_Lbl.text = getEmployeeName2
        self.emisalary_Lbl.text = getEmployeeName3
        
        // Do any additional setup after loading the view.
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
