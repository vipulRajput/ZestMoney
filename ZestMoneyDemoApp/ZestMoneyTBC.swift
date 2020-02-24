//
//  ZestMoneyTBC.swift
//  ZestMoneyDemoApp
//
//  Created by Vipul Kumar on 24/02/20.
//  Copyright © 2020 Vipul Kumar. All rights reserved.
//

import UIKit

class ZestMoneyTBC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTabBar()
    }
    
    //MARK: PRIVATE FUNCTIONS
    //==========================
    private func setUpTabBar() {
        
        tabBar.barTintColor = UIColor.white
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6823529412, green: 0.1568627451, blue: 0.1960784314, alpha: 1)], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        
        let image = UIImage(named: "grey")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let selectedImage = UIImage(named: "red")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let homeTabBarItem:UITabBarItem = UITabBarItem(title: "HOME", image: image, selectedImage: selectedImage)
        let profileTabBarItem:UITabBarItem = UITabBarItem(title: "PROFILE", image: image, selectedImage: selectedImage)
        let supportTabBarItem:UITabBarItem = UITabBarItem(title: "SUPPORT", image: image, selectedImage: selectedImage)
        
        let home = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EntityDescriptionVC")
        let profile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")
        let support = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SupportVC")
        
        home.tabBarItem = homeTabBarItem
        profile.tabBarItem = profileTabBarItem
        support.tabBarItem = supportTabBarItem
        
        self.viewControllers = [home, profile, support]
    }
}
