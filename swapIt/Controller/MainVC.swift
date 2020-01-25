//
//  MainVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/24/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

let collectionsCell = "collectionsCell"

class MainVC: UIViewController {
    
    let colorArray = [UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink,UIColor.lightGray,UIColor.blue,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black,UIColor.black]
    
    let numbeOfItemsInRow = 3
  
    lazy var mainSegnment: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["My Collections", "Albums"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .clear
        sc.backgroundColor = .clear
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        sc.selectedSegmentTintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegnmentDidChange), for: .valueChanged)

        return sc
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 0
//        layout.
//        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .orange
        // preferredContentSize = layout.itemSize
        
        /// registering cell
        cv.register(CollectionsCell.self, forCellWithReuseIdentifier: collectionsCell)
        return cv
    }()

    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        setNavigationBar()
        setupCollectionView()
    }
    
    @objc fileprivate func handleSegnmentDidChange(){
        if mainSegnment.selectedSegmentIndex == 1 {
            view.backgroundColor = .cyan
        }
        else
        {
            view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        }
        
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "My Collections"
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
        
        let profileImage = UIImage.init(named: "millie.jpg")
//        /// profileBtn instance
        let profileBtn = UIButton(type: .custom)
        profileBtn.setImage(profileImage, for: .normal)
        profileBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        profileBtn.layer.cornerRadius = profileBtn.frame.size.height/2
        profileBtn.layer.masksToBounds = false
        profileBtn.clipsToBounds = true
        profileBtn.layer.borderWidth = 1.0
        profileBtn.layer.borderColor = UIColor.red.cgColor

//        /// height and width constrainnts of profileBtn
        let widthConstraint = profileBtn.widthAnchor.constraint(equalToConstant: 40)
        let heightConstraint = profileBtn.heightAnchor.constraint(equalToConstant: 40)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        profileBtn.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
//        
//        /// add profileBtn to UIBarButtonItem on the left side
        let profileItem = UIBarButtonItem(customView: profileBtn)
        navigationItem.leftBarButtonItem =  profileItem
//
//        /// add addBtn  to UIBarButtonItem on the right side
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: #selector(addBtnPressed))
        navigationItem.rightBarButtonItem = addItem
        
    }

    @objc func addBtnPressed() {

    }
    
    @objc func profileImagePressed(){
        let userProfileVC = UserProfileVC()
        self.present(userProfileVC, animated: true)
    }
    
    func setupCollectionView(){
        [mainSegnment, collectionView].forEach({view.addSubview($0)})
        collectionView.backgroundColor = .clear
//        view.sendSubviewToBack(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
//        mainSegnment.isHidden = true
        mainSegnment.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15))
        
        collectionView.anchor(top: mainSegnment.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 15, left: 15, bottom: 0, right: 15))
    }
    
}

/// layout extension
extension MainVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionsCell, for: indexPath) as! CollectionsCell
        cell.backgroundColor = colorArray[indexPath.item]
        return cell
    }
//   func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.navigationController?.navigationBar.prefersLargeTitles = (velocity.y < 0)
//        })
//    }
    
    // MARK: UICollectionViewDelegateFlowLayout functions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (self.collectionView.frame.width/3.0) - 5 , height: (self.collectionView.frame.height/6))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
}
