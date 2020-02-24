//
//  AccountDetailsVC.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class AccountDetailsVC: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var maximizedSections = [Int]()
    var cellHeightsDictionary: [IndexPath: CGFloat] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AccountDetailsVC {
    
    fileprivate func initialSetup() {
        
        self.detailsTableView.register(UINib(nibName: "AdjustableLabelTableCell", bundle: nil), forCellReuseIdentifier: "AdjustableLabelTableCell")
        self.detailsTableView.register(UINib(nibName: "QuestionsHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuestionsHeaderView")
        self.detailsTableView.estimatedSectionHeaderHeight = 30
        self.detailsTableView.estimatedRowHeight = 50
        self.detailsTableView.dataSource = self
        self.detailsTableView.delegate = self
    }
    
    @objc fileprivate func minMaxHeaderBtnTapped(_ sender: UIButton) {
        
        if self.maximizedSections.contains(sender.tag), let index = self.maximizedSections.firstIndex(of: sender.tag) {
            self.maximizedSections.remove(at: index)
        } else {
            self.maximizedSections = [sender.tag]
        }
        self.detailsTableView.reloadData()
    }
}

extension AccountDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.maximizedSections.contains(section) {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdjustableLabelTableCell", for: indexPath) as? AdjustableLabelTableCell else {
            fatalError("AdjustableLabelTableCell not found!")
        }
        
        cell.titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.cellHeightsDictionary[indexPath] = cell.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height =  self.cellHeightsDictionary[indexPath] {
            return height
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let height =  self.cellHeightsDictionary[indexPath] {
            return height
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuestionsHeaderView") as? QuestionsHeaderView else {
            fatalError("QuestionsHeaderView not found")
        }
        headerView.clickBtn.tag = section
        headerView.containerView.backgroundColor = UIColor.white
        headerView.clickBtn.addTarget(self, action: #selector(minMaxHeaderBtnTapped), for: .touchUpInside)
        headerView.titleLabel.text = "This is a dummy question?"
        
        if self.maximizedSections.contains(section) {
            headerView.upDownImage.image = UIImage(named: "ic-expand-more-24px")
            headerView.titleLabel.textColor = UIColor.black
            headerView.titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            headerView.seperatorView.isHidden = true
        } else {
            headerView.upDownImage.image = UIImage(named: "ic-expand-more-24px-1")
            headerView.titleLabel.textColor = UIColor.black.withAlphaComponent(0.7)
            headerView.titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            headerView.seperatorView.isHidden = false
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}
