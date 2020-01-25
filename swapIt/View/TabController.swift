//
//  TabController.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/26/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    let homeVC = MainVC()
    let swapVC = SwapVC()
    let exploreVC = ExploreVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
    }
    
    fileprivate func setupVCs(){
        tabBar.barTintColor =  UIColor.rgb(red: 22, green: 23, blue: 27)
        tabBar.tintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
        
        viewControllers = [createControllers(title: "Home", imageName: "house", vc: homeVC), createControllers(title: "Swap", imageName: "arrow.right.arrow.left", vc: swapVC), createControllers(title: "Explore", imageName: "globe", vc: exploreVC)]
    }
    fileprivate func createControllers(title: String, imageName: String, vc: UIViewController) -> UINavigationController{
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.title = title
        recentVC.tabBarItem.image = UIImage(systemName: imageName)
        return recentVC
    }
}
