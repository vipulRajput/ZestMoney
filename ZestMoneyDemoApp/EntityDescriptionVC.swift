//
//  EntityDescriptionVC.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class EntityDescriptionVC: UIViewController {

    @IBOutlet weak var entityDescriptionTableView: UITableView!
    
    let offersImages = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8"]
    let companysImages = [["flipkartlogo", "Paytm", "amazon", "mi"],
                          ["clovia", "drivezy", "fbb", "peterengland"],
                          ["Uber", "shuttl", "levis", "leaf", "homecentre", "flatheads"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialSetup()
    }
}

extension EntityDescriptionVC {
    
    fileprivate func initialSetup() {
        
        self.entityDescriptionTableView.register(UINib(nibName: "FeaturedTableCell", bundle: nil), forCellReuseIdentifier: "FeaturedTableCell")
        self.entityDescriptionTableView.dataSource = self
        self.entityDescriptionTableView.delegate = self
    }
}

extension EntityDescriptionVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedTableCell", for: indexPath) as? FeaturedTableCell else {
            fatalError("FeaturedTableCell not found!")
        }
        
        cell.indexPath = indexPath
        
        cell.titleLabel.text = indexPath.section == 0 ? "FEATURED MERCHANTS" : indexPath.row == 0 ? "SMARTPHONES & ELECTRONICS" : indexPath.row == 1 ? "FASHION" : "FURNITURE & INTERIORS"
        cell.titleLabel.font = indexPath.section == 0 ? UIFont.systemFont(ofSize: 16, weight: .medium) : UIFont.systemFont(ofSize: 13, weight: .regular)
        cell.titleLabel.textColor = indexPath.section == 0 ? UIColor.black : UIColor.lightGray
        
        cell.titleLabelTop.constant = indexPath.section == 0 || indexPath.row == 0 ? 12 : 0
        cell.featuresCollectionViewHeight.constant = indexPath.section == 0 ? 160 : 130
        
        cell.featuresCollectionView.register(UINib(nibName: "ShowImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ShowImageCollectionCell")
        cell.featuresCollectionView.register(UINib(nibName: "FeatureCollectionCell", bundle: nil), forCellWithReuseIdentifier: "FeatureCollectionCell")
        cell.featuresCollectionView.dataSource = self
        cell.featuresCollectionView.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        footerView.backgroundColor = section == 0 ? UIColor.systemGroupedBackground : UIColor.white
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func gradient(frame:CGRect, row: Int) -> CAGradientLayer {
            
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0.0, y: 1.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        switch row {
                        
//        case 0:
//            layer.colors = [UIColor(red: 0.381, green: 0.453, blue: 0.309, alpha: 1).cgColor,
//            UIColor(red: 0.716, green: 0.808, blue: 0.625, alpha: 1).cgColor]
//        case 1:
//            layer.colors = [UIColor(red: 0.407, green: 0.489, blue: 0.55, alpha: 1).cgColor,
//            UIColor(red: 0.902, green: 0.902, blue: 0.894, alpha: 1).cgColor]
//        default:
//            layer.colors = [UIColor(red: 0.707, green: 0.689, blue: 0.605, alpha: 1).cgColor,
//            UIColor(red: 0.902, green: 0.902, blue: 0.894, alpha: 1).cgColor]
//        }
//            case 0:
//                layer.colors = [UIColor(red: 255, green: 116, blue: 23, alpha: 1).cgColor,
//                UIColor(red: 245, green: 216, blue: 93, alpha: 1).cgColor]
//            case 1:
//                layer.colors = [UIColor(red: 71, green: 194, blue: 252, alpha: 1).cgColor,
//                UIColor(red: 88, green: 157, blue: 255, alpha: 1).cgColor]
//            default:
//                layer.colors = [UIColor(red: 63, green: 36, blue: 192, alpha: 1).cgColor,
//                UIColor(red: 206, green: 141, blue: 216, alpha: 1).cgColor]
//            }
            
        case 0:
            layer.colors = [#colorLiteral(red: 1, green: 0.4549019608, blue: 0.09019607843, alpha: 1).cgColor, #colorLiteral(red: 0.9607843137, green: 0.8470588235, blue: 0.3647058824, alpha: 1).cgColor]
        case 1:
            layer.colors = [#colorLiteral(red: 0.2784313725, green: 0.7607843137, blue: 0.9882352941, alpha: 1).cgColor, #colorLiteral(red: 0.3450980392, green: 0.6156862745, blue: 1, alpha: 1).cgColor]
        default:
            layer.colors = [#colorLiteral(red: 0.2470588235, green: 0.1411764706, blue: 0.7529411765, alpha: 1).cgColor, #colorLiteral(red: 0.8078431373, green: 0.5529411765, blue: 0.8470588235, alpha: 1).cgColor]
        }
        
        return layer
    }
}

extension EntityDescriptionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let tableCell = collectionView.tableViewCell() as? FeaturedTableCell else {
            return 3
        }
        if tableCell.indexPath.section == 0 {
            return self.offersImages.count
        } else {
            return self.companysImages[tableCell.indexPath.section].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let tableCell = collectionView.tableViewCell() as? FeaturedTableCell else {
            fatalError("FeaturedTableCell not found")
        }
        if tableCell.indexPath.section == 0 {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowImageCollectionCell", for: indexPath) as? ShowImageCollectionCell else {
                fatalError("ShowImageCollectionCell not found")
            }
            
            cell.showingImage.image = UIImage(named: self.offersImages[indexPath.item])
            
            return cell
            
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCollectionCell", for: indexPath) as? FeatureCollectionCell else {
                fatalError("FeatureCollectionCell not found")
            }
            
            cell.showingImage.image = UIImage(named: self.companysImages[tableCell.indexPath.row][indexPath.item])
            cell.gradientView.layer.insertSublayer(self.gradient(frame: cell.bounds, row: tableCell.indexPath.row), at:0)
            cell.gradientView.backgroundColor = UIColor.clear
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let tableCell = collectionView.tableViewCell() as? FeaturedTableCell else {
            fatalError("FeaturedTableCell not found")
        }
        if tableCell.indexPath.section == 0 {
            return CGSize(width: 270, height: collectionView.frame.height)
        } else {
            return CGSize(width: 130, height: collectionView.frame.height)
        }
    }
}
