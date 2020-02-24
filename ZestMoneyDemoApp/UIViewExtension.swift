//
//  UIViewExtension.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func shadow(shadowRadius: CGFloat = 1) {
        
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        //        self.layer.cornerRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shouldRasterize = false
    }
    
    func tableViewCell() -> UITableViewCell? {
        
        var tableViewcell : UIView? = self
        
        while(tableViewcell != nil) {
            
            if tableViewcell! is UITableViewCell {
                break
            }
            tableViewcell = tableViewcell!.superview
        }
        return tableViewcell as? UITableViewCell
    }
    
    func tableViewIndexPath(tableView: UITableView) -> NSIndexPath? {
        
        if let cell = self.tableViewCell() {
            return tableView.indexPath(for: cell) as NSIndexPath?
        }
        return nil
    }
}


