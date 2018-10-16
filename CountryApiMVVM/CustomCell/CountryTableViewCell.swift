//
//  CountryTableViewCell.swift
//  CountryApiMVVM
//
//  Created by Ady on 10/2/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var flagImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
