//
//  ReceiveViewController.swift
//  AlamofireDemo
//
//  Created by Bala Krishna on 13/12/21.
//  Copyright © 2021 Bala Krishna. All rights reserved.
//

import UIKit

class ReceiveViewController: UIViewController {
    var getEmployeeNameReceive:String = ""

    @IBOutlet weak var dataReceive_Lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataReceive_Lbl.text = getEmployeeNameReceive

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
