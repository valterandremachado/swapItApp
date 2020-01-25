//
//  SwapVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/26/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit

class SwapVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        setNavigationBar()
    }
    
    func setNavigationBar() {
            navigationController?.navigationBar.topItem?.title = "Swappy"
            /// navBar color
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            /// navBarItem color
            navigationController?.navigationBar.tintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
            /// navBarTitle color
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            /// navBar  largeTitle color
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .automatic
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
//            let profileImage = UIImage.init(named: "millie.jpg")
//    //        /// profileBtn instance
//            let profileBtn = UIButton(type: .custom)
//            profileBtn.setImage(profileImage, for: .normal)
//            profileBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//            profileBtn.layer.cornerRadius = profileBtn.frame.size.height/2
//            profileBtn.layer.masksToBounds = false
//            profileBtn.clipsToBounds = true
//            profileBtn.layer.borderWidth = 1.0
//            profileBtn.layer.borderColor = UIColor.red.cgColor
//
//    //        /// height and width constrainnts of profileBtn
//            let widthConstraint = profileBtn.widthAnchor.constraint(equalToConstant: 40)
//            let heightConstraint = profileBtn.heightAnchor.constraint(equalToConstant: 40)
//            heightConstraint.isActive = true
//            widthConstraint.isActive = true
//            profileBtn.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
//    //
//    //        /// add profileBtn to UIBarButtonItem on the left side
//            let profileItem = UIBarButtonItem(customView: profileBtn)
//            navigationItem.leftBarButtonItem =  profileItem
//    //
//    //        /// add addBtn  to UIBarButtonItem on the right side
//            let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: #selector(addBtnPressed))
//            navigationItem.rightBarButtonItem = addItem
//
        }
}
