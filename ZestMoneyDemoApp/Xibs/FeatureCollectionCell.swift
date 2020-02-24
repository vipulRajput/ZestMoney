//
//  FeatureCollectionCell.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class FeatureCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var showingImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.bgView.clipsToBounds = true
        self.bgView.layer.cornerRadius = 5
        self.bgView.shadow()
        
        self.containerView.clipsToBounds = true
        self.gradientView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 5
    }
}
