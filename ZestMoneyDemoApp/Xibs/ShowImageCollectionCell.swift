//
//  ShowImageCollectionCell.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class ShowImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var showingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.layer.cornerRadius = 5
        self.bgView.clipsToBounds = true
        self.bgView.shadow()
        
        self.containerView.layer.cornerRadius = 5
        self.containerView.clipsToBounds = true
        self.showingImage.clipsToBounds = true
    }
}
