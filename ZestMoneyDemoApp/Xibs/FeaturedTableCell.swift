//
//  FeaturedTableCell.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class FeaturedTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelTop: NSLayoutConstraint!
    @IBOutlet weak var featuresCollectionView: UICollectionView!
    @IBOutlet weak var featuresCollectionViewHeight: NSLayoutConstraint!
    
    //MARK:- PROPERTIES
    //=========================
    var indexPath = IndexPath()
    
    //MARK:- CELL LIFE CYCLE
    //============================
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.featuresCollectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        DispatchQueue.main.async {
            self.featuresCollectionView.reloadData()
        }
    }
}
