//
//  ProfileVC.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    
    let titleArr = [["Personal details", "Employment details", "Bank details"],
                    ["Account statement", "UPI", "Logout"]]
    let descriptionArr = [["PAN card, Aadhaar card", "Salary details", "Netbanking, Account details"],
                    ["Loan amount statement", " ", "Logout account"]]
    let imageArr = [["c", "d", "b"], ["e", "f", "g"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialSetup()
    }
}

extension ProfileVC {
    
    fileprivate func initialSetup() {
                
        self.profileTableView.register(UINib(nibName: "UserDetailsTableCell", bundle: nil), forCellReuseIdentifier: "UserDetailsTableCell")
        self.profileTableView.dataSource = self
        self.profileTableView.delegate = self
    }
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTablecell", for: indexPath) as? ProfileTablecell else {
                fatalError("ProfileTablecell not found!")
            }
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTableCell", for: indexPath) as? UserDetailsTableCell else {
                fatalError("UserDetailsTableCell not found!")
            }
            
            cell.titleLabel.text = self.titleArr[indexPath.section - 1][indexPath.row]
            cell.descriptionLabel.text = self.descriptionArr[indexPath.section - 1][indexPath.row]
            cell.iconLabel.text = self.imageArr[indexPath.section - 1][indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        footerView.backgroundColor = section == 2 ? UIColor.white : UIColor.systemGroupedBackground
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

class ProfileTablecell: UITableViewCell {
    
    @IBOutlet weak var firstLetterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.firstLetterLabel.layer.borderColor = UIColor.black.cgColor
        self.firstLetterLabel.layer.borderWidth = 1
        self.firstLetterLabel.layer.cornerRadius = self.firstLetterLabel.frame.height / 2
        self.firstLetterLabel.clipsToBounds = true
    }
}
