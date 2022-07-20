//
//  TabBarController.swift
//  ElectronicsStoreSwift
//
//  Created by Pinto Junior, William James on 19/07/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let cartVC = CartViewController()
        let savedVC = SavedViewController()
        let profileVC = ProfileViewController()
        
        self.setViewControllers([homeVC, cartVC, savedVC, profileVC], animated: false)
        self.tabBar.tintColor = UIColor(named: "Primary")
        self.tabBar.barTintColor = UIColor(named: "Backgroud")

        guard let items = self.tabBar.items else { return }
        let icons = ["house.fill", "cart.fill", "bookmark.fill", "person.fill"]
        
        for i in 0...3 {
            items[i].image = UIImage(systemName: icons[i])
        }
        
    }
}
