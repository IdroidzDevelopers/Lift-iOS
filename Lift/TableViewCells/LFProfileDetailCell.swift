//
//  LFProfileDetailCell.swift
//  Lift
//
//  Created by Navya on 5/31/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LFProfileDetailCell: UITableViewCell {

    @IBOutlet var baseView: UIView!
    @IBOutlet var descimage: UIImageView!
    @IBOutlet var lineView: UIView!
    @IBOutlet var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
