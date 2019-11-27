//
//  CustomCellTableViewCell.swift
//  TablaCiudades
//
//  Created by juan.alvarez on 27/11/2019.
//  Copyright © 2019 Juan Alvarez. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
