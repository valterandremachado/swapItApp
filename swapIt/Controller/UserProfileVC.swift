//
//  ProfileVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/25/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

let userInfoCellID = "userInfoCell"

class UserProfileVC: UIViewController {
    
    let userInfo:[[String]] = [
        ["MEET-UP PLACES",       "SM Baguio City, Pines Resto"],
        ["MEET-UP DAYS",      "Monday to Friday"],
        ["MEET-UP TIME",        "8 am to 6 m"],
        ["CONTACT INFO", "+63 222 3383 2795"]
    ]
    let profileImage = UIImage(named: "millie.jpg")
    let collectionNo = 0
    let swappableNo = 0
    
    lazy var doneBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Done", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 18)
        btn.tintColor = UIColor.rgb(red: 253, green: 39, blue: 93)
        btn.addTarget(self, action: #selector(doneBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var editBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Edit", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 18)
        btn.tintColor = UIColor.rgb(red: 253, green: 39, blue: 93)
        btn.addTarget(self, action: #selector(editBtnPressed), for: .touchUpInside)
        return btn
    }()
    
     var profileImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.borderWidth = 2
        iv.clipsToBounds = true
        iv.layer.borderColor = .init(srgbRed: 253/255, green: 39/255, blue: 93/255, alpha: 1)
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
        lb.textColor = UIColor.rgb(red: 253, green: 39, blue: 93)
        lb.text = "0"
        lb.font = .boldSystemFont(ofSize: 18)

        return lb
    }()
    
    lazy var swappableNoLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.rgb(red: 253, green: 39, blue: 93)
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
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
//        tv.separatorColor = .gray
//        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = false
        
        tv.delegate = self
        tv.dataSource = self
        tv.register(UserInfoCell.self, forCellReuseIdentifier: userInfoCellID)
        return tv
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        self.tableView.tableFooterView = UIView()

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
    
    @objc fileprivate func editBtnPressed(){
        let editProfileVC = EditUserProfileVC()
        present(editProfileVC, animated: true, completion: nil)
    }
    
    fileprivate func profileCircleLayer(){
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: view.frame.width/3 - 8, y: view.frame.width/3.54, width: view.frame.width/3 + 15, height: view.frame.size.width/3 + 15)).cgPath
        circleLayer.strokeColor = .init(srgbRed: 235/255, green: 51/255, blue: 72/255, alpha: 1)
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
    }
    
    fileprivate func setupView(){
        [profileImageView, doneBtn, editBtn, userName, userLocation, upperStackView, lowerStackView, tableView].forEach({view.addSubview($0)})
        profileImageView.image = profileImage
        /// view constrainsts
        doneBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0))
        editBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15))
        
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 60, left: view.frame.width/3, bottom: 0, right: view.frame.width/3),size: CGSize.init(width: 0, height: view.frame.size.width/3))
        
        userName.anchor(top: profileImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 25, left: 0, bottom: 0, right: 0))
        
        userLocation.anchor(top: userName.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0))
        /// stackviews constraints
        upperStackView.anchor(top: userName.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 60, left: view.frame.width/4, bottom: 0, right: view.frame.width/4), size: CGSize.init(width: 0, height: 20))
        lowerStackView.anchor(top: upperStackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 15, left: view.frame.width/8 , bottom: 0, right: view.frame.width/8), size: CGSize.init(width: 0, height: 20))
        
        tableView.anchor(top: lowerStackView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 40, left: 20, bottom: 0, right: 20))

    }
}

extension UserProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
//        tableView.estimatedRowHeight = 200
//        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: userInfoCellID, for: indexPath) as! UserInfoCell
//        cell.meetUpDaysLbl.text = dayLblArray[indexPath.row][0]
        
        if cell == nil
        {
            cell = UserInfoCell(style: .subtitle, reuseIdentifier: userInfoCellID)
        }
        
        /// give tableView its full separator width
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        /// assign title amd subtitle on the tableView
        cell.infoTitle.text = userInfo[indexPath.row][0]
        cell.infoDetails.text = userInfo[indexPath.row][1]
        
        /// change title and subtitle color
        cell.infoTitle.textColor = .lightGray
        cell.infoDetails.textColor = .white
        
        return cell
    }
    
    
}

