//
//  ProfileVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/25/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class UserProfileVC: UIViewController {
    
    let profileImage = UIImage(named: "millie.jpg")
    let collectionNo = 0
    let swappableNo = 0
    
    lazy var doneBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Done", for: .normal)
        btn.tintColor = UIColor(displayP3Red: 235/255, green: 51/255, blue: 72/255, alpha: 1)
        btn.addTarget(self, action: #selector(doneBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var editBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Edit", for: .normal)
        btn.tintColor = UIColor(displayP3Red: 235/255, green: 51/255, blue: 72/255, alpha: 1)

        return btn
    }()
    
     var profileImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.borderWidth = 2
        iv.clipsToBounds = true
        iv.layer.borderColor = .init(srgbRed: 235/255, green: 51/255, blue: 72/255, alpha: 1)
        iv.contentMode = .scaleAspectFill
//        iv.backgroundColor = .blue
        return iv
    }()
    
    lazy var userName: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.text = "Millie Bobby"
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var userLocation: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .lightGray
        lb.text = "Session Rd, Baguio City"
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var collectionNoLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .red
        lb.text = "0"
        lb.font = .boldSystemFont(ofSize: 18)

        return lb
    }()
    
    lazy var swappableNoLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .red
        lb.text = "0"
        lb.font = .boldSystemFont(ofSize: 18)

        return lb
    }()
    lazy var collectionsLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .lightGray
        lb.text = "COLLECTIONS"
        return lb
    }()
    
    lazy var swappablesLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .lightGray
        lb.text = "SWAPPABLES"
        return lb
    }()
    
    lazy var upperStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [collectionNoLbl, swappableNoLbl])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .equalCentering
        return sv
    }()
    
    lazy var lowerStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [collectionsLbl, swappablesLbl])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .equalCentering
        return sv
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
//        profileCircleLayer()
        setupView()
    }
    override func viewWillLayoutSubviews() {
        DispatchQueue.main.async {
//            self.view.layoutIfNeeded()
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        }
    }
    
    @objc func doneBtnPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func profileCircleLayer(){
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: view.frame.width/3 - 8, y: view.frame.width/3.54, width: view.frame.width/3 + 15, height: view.frame.size.width/3 + 15)).cgPath
        circleLayer.strokeColor = .init(srgbRed: 235/255, green: 51/255, blue: 72/255, alpha: 1)
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
    }
    
    fileprivate func setupView(){
        [profileImageView, doneBtn, editBtn, userName, userLocation, upperStackView, lowerStackView].forEach({view.addSubview($0)})
        profileImageView.image = profileImage
        /// view constrainsts
        doneBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0))
        editBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15))
        
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 80, left: view.frame.width/3, bottom: 0, right: view.frame.width/3),size: CGSize.init(width: 0, height: view.frame.size.width/3))
        
        userName.anchor(top: profileImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 25, left: 0, bottom: 0, right: 0))
        
        userLocation.anchor(top: userName.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0))
        /// stackviews constraints
        upperStackView.anchor(top: userName.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 75, left: view.frame.width/4, bottom: 0, right: view.frame.width/4), size: CGSize.init(width: 0, height: 20))
        lowerStackView.anchor(top: upperStackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 15, left: view.frame.width/8 , bottom: 0, right: view.frame.width/8), size: CGSize.init(width: 0, height: 20))

    }
}

