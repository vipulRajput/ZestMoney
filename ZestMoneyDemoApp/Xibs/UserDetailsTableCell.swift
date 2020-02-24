//
//  UserDetailsTableCell.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class UserDetailsTableCell: UITableViewCell {

    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.iconLabel.layer.cornerRadius = self.iconLabel.frame.height / 2
        self.iconLabel.clipsToBounds = true
    }
}
