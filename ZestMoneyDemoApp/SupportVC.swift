//
//  SupportVC.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class SupportVC: UIViewController {

    @IBOutlet weak var supportTableView: UITableView!
    
    let titleArr = [["Getting Credit Limit", "Pay with ZestMoney", "EMI Repayments", "EMI using Voucher Codes", "Account Details"],
                    ["Call", "Email"],
                    ["Rate us", "About us"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
    }
}

extension SupportVC {
    
    fileprivate func initialSetup() {
                
        self.supportTableView.register(UINib(nibName: "SupportTableCell", bundle: nil), forCellReuseIdentifier: "SupportTableCell")
        self.supportTableView.register(UINib(nibName: "QuestionsHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuestionsHeaderView")
        self.supportTableView.estimatedSectionHeaderHeight = 30
        self.supportTableView.estimatedRowHeight = 50
        self.supportTableView.dataSource = self
        self.supportTableView.delegate = self
    }
}

extension SupportVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SupportTableCell", for: indexPath) as? SupportTableCell else {
            fatalError("SupportTableCell not found!")
        }
        
        cell.titleLabel.text = self.titleArr[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuestionsHeaderView") as? QuestionsHeaderView else {
            fatalError("QuestionsHeaderView not found")
        }
        headerView.clickBtn.tag = section
        headerView.containerView.backgroundColor = UIColor.white
        headerView.titleLabel.text = section == 0 ? "FREQUENTLY ASKED QUESTIONS" : "CONTACT US"
        headerView.titleLabel.textColor = UIColor.black
        headerView.titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)

        return section == 2 ? UIView() : headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 ? 0.0001 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        footerView.backgroundColor = section == 2 ? UIColor.white : UIColor.systemGroupedBackground
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let accountDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AccountDetailsVC")
        self.navigationController?.pushViewController(accountDetailsVC, animated: true)
    }
}


