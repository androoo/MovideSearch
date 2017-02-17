//
//  MainTabBarController.swift
//  MovieSearch
//
//  Created by Andrew Ervin Gierke on 2/17/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = UIColor.init(red: 5.0/255.0, green: 211.0/255.0, blue: 186.0/255.0, alpha: 1)
        
        self.tabBar.unselectedItemTintColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.25)
        
        self.tabBar.tintColor = .white
        
    }
}
