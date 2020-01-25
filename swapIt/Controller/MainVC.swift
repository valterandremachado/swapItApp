//
//  MainVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/24/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class MainVC: UIViewController {
    
    var navBar = UINavigationBar()
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        setNavigationBar()
    }
    
    
    func setNavigationBar() {
        self.view.addSubview(navBar)

//        let screenSize: CGRect = UIScreen.main.bounds
//        let screenHeight = screenSize.height
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenHeight*9))
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize.init(width: 0, height: 100))
        let navItem = UINavigationItem(title: "My Collections")
 
        let ProfileImageBtn = UIImage.init(named: "millie.jpg")
        let profileImageView = UIImageView.init(image: ProfileImageBtn)
        profileImageView.frame = CGRect(x:0.0,y:0.0, width:40,height:40)
        profileImageView.maskCircle(anyImage: ProfileImageBtn!)
        
        let imageItem = UIBarButtonItem(customView: profileImageView)
        let widthConstraint = profileImageView.widthAnchor.constraint(equalToConstant: 40)
        let heightConstraint = profileImageView.heightAnchor.constraint(equalToConstant: 40)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
//        navItem.leftBarButtonItem =  imageItem

        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "millie.jpg"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn1.layer.cornerRadius = btn1.frame.size.height/2
        btn1.layer.masksToBounds = false
        btn1.clipsToBounds = true
        btn1.layer.borderWidth = 1.0
        btn1.layer.borderColor = UIColor.red.cgColor
        
        let widthConstraint1 = btn1.widthAnchor.constraint(equalToConstant: 40)
        let heightConstraint1 = btn1.heightAnchor.constraint(equalToConstant: 40)
        heightConstraint1.isActive = true
        widthConstraint1.isActive = true
        btn1.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        navItem.leftBarButtonItem =  item1


        
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = addItem
//        let profileItem = UIBarButtonItem(barButtonSystemItem: profileBtn, target: nil, action: #selector(done))
//        navItem.leftBarButtonItem = imageItem
        navBar.setItems([navItem], animated: true)
        
    }

    @objc func done() {

    }
    @objc func profileImagePressed(){
        let userProfileVC = UserProfileVC()
        self.present(userProfileVC, animated: true)
    }
    
}

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.layer.borderWidth = 1.0
    self.layer.borderColor = UIColor.red.cgColor
   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
   self.image = anyImage
  }
}

