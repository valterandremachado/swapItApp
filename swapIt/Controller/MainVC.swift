//
//  MainVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/24/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

let collectionsCellID = "collectionsCell"
let segnmentedCellID = "segmentedCell"

class MainVC: UIViewController {
    
    let colorArray = [UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink]
    /// album of swappable things
    let albumArray = ["Album", "Album","Album","Album","Album","Album","Album","Album", "Album", "Album","Album","Album","Album","Album","Album","Album", "Album", "Album","Album","Album","Album","Album","Album","Album"]
    /// collection of swappable things
    let collectionArray = ["Collection", "Collection","Collection","Collection","Collection","Collection"]

    let numbeOfItemsInRow = 3
  
    lazy var mainSegnment: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Collections", "Albums"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .clear
        sc.backgroundColor = .clear
//        sc.removeBorders()
        sc.layer.borderWidth = 0
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//        sc.sizeToFit()
        sc.selectedSegmentTintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegnmentDidChange), for: .valueChanged)

        return sc
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        /// makes the header stick on top
        layout.sectionHeadersPinToVisibleBounds = true

//        layout.minimumLineSpacing = 10
//        layout.
//        layout.minimumInteritemSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .orange
        cv.dataSource = self
        cv.delegate = self
        // preferredContentSize = layout.itemSize
        /// registering cell
        cv.register(CollectionsCell.self, forCellWithReuseIdentifier: collectionsCellID)
        cv.register(SegnmentedCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: segnmentedCellID)
        return cv
    }()
    
    let itemsToDisplay = 0
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        setNavigationBar()
        setupCollectionView()
    }
    
    
    
    func setNavigationBar() {
         navigationController?.navigationBar.topItem?.title = "My Collections"
        /// navBar color
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.hideNavBarSeperator()
        /// navBarItem color
        navigationController?.navigationBar.tintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
        /// navBarTitle color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        /// navBar  largeTitle color
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let profileImage = UIImage.init(named: "millie.jpg")
        /// profileBtn instance
        let profileBtn = UIButton(type: .custom)
        profileBtn.imageView?.contentMode = .scaleAspectFill
        profileBtn.setImage(profileImage, for: .normal)
        profileBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        profileBtn.layer.cornerRadius = profileBtn.frame.size.height/2
        profileBtn.layer.masksToBounds = false
        profileBtn.clipsToBounds = true
//        profileBtn.layer.borderWidth = 1.5
        profileBtn.sizeToFit()
//        profileBtn.layer.borderColor = UIColor.red.cgColor

        /// height and width constrainnts of profileBtn
        let widthConstraint = profileBtn.widthAnchor.constraint(equalToConstant: 30)
        let heightConstraint = profileBtn.heightAnchor.constraint(equalToConstant: 30)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        profileBtn.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
//        
        /// add profileBtn to UIBarButtonItem on the left side
        let profileItem = UIBarButtonItem(customView: profileBtn)
        navigationItem.leftBarButtonItem =  profileItem
        
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
////        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        toolBar.items = [add]
//        toolBar.addSubview(mainSegnment)
//        navigationItem.titleView = mainSegnment

//        navigationController?.setToolbarHidden(false, animated: false)

//        toolBar.tintColor = .red
        
        /// add addBtn  to UIBarButtonItem on the right side
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: #selector(addBtnPressed))
        navigationItem.rightBarButtonItem = addItem
//        mainSegnment.frame(forAlignmentRect: CGRect(x: 0, y: -50, width: 44, height: 44))
//        let sc = UIBarButtonItem(customView: mainSegnment)
//        sc.customView?.frame(forAlignmentRect: CGRect(x: -50, y: -50, width: 44, height: 44))
//        navigationItem.rightBarButtonItem =  sc
        
    }
    
    @objc func addBtnPressed() {

    }
  
    @objc func profileImagePressed(){
        let userProfileVC = UserProfileVC()
        userProfileVC.modalPresentationStyle = .fullScreen
        self.present(userProfileVC, animated: true)
    }
    
    func setupCollectionView(){
        [collectionView].forEach({view.addSubview($0)})
        collectionView.backgroundColor = .clear
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15))
//        collectionView.layoutIfNeeded()
    }
}

/// layout extension
extension MainVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource functions
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch mainSegnment.selectedSegmentIndex {
        case 0:
            return collectionArray.count
        case 1:
            return albumArray.count
        default:
            break
        }

        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionsCellID, for: indexPath) as! CollectionsCell
    
        switch mainSegnment.selectedSegmentIndex {
        case 0:
            cell.backgroundColor = colorArray[indexPath.item]
            cell.lbl.text = collectionArray[indexPath.item]
            cell.lbl.textColor = .white
            navigationController?.navigationBar.topItem?.title = "My Collections"
        case 1:
            cell.backgroundColor = colorArray[indexPath.item]
            cell.lbl.text = albumArray[indexPath.item]
            cell.lbl.textColor = .white
            navigationController?.navigationBar.topItem?.title = "Albums"
        default:
            cell.backgroundColor = colorArray[indexPath.item]
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
            String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                    segnmentedCellID, for: indexPath) as! SegnmentedCell
        
        /// added mainSegnment to segnmentedCell (header) subview in other to keep track of the segnment switch right from the MainVC
        header.addSubview(mainSegnment)
        header.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        mainSegnment.anchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, padding: UIEdgeInsets.init(top: 20, left: 40, bottom: 15, right: 40))
        
            return header
        }
    
    @objc fileprivate func handleSegnmentDidChange(sender: UISegmentedControl){
        /// reload collectionView data when the user switches between segnment
        collectionView.reloadData()

    }
        

        /// header height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 65)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout functions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        if indexPath.item == 0{
//            return CGSize(width: collectionView.frame.width - 15, height: 50)
//        }
        return CGSize(width: (self.collectionView.frame.width/3.0) - 4 , height: (self.collectionView.frame.height/6))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
}

extension UINavigationBar {

func hideNavBarSeperator()
{
    let img = UIImage()
    self.shadowImage = img
    self.setBackgroundImage(img, for: UIBarMetrics.default)
}

func showNavBarSeperator()
{
    let img = UIImage.pixelImageWithColor(color: UIColor.red)//Use Any Color
    self.shadowImage = img
}
}
extension UIImage {
class func pixelImageWithColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()

    context!.setFillColor(color.cgColor)
    context!.fill(rect)

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return image!
}
}
