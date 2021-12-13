//
//  DataTableViewCell.swift
//  AlamofireDemo
//
//  Created by Bala Krishna on 13/12/21.
//  Copyright © 2021 Bala Krishna. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var name_Lbl: UILabel!
    
    @IBOutlet weak var salary_Lbl: UILabel!
    
    @IBOutlet weak var id_Lbl: UILabel!
    
    @IBOutlet weak var Age_Lbl: UILabel!
    
    
    @IBOutlet weak var img_View: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
