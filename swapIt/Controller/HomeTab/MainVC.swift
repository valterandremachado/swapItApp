//
//  MainVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/24/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

let collectionCellID = "collectionCell"
let albumCellID = "albumCell"
let segmentedCellID = "segmentedCell"

class MainVC: UIViewController {
    
    let itemImage = UIImage.init(named: "millie.jpg")
    
    let userInfo:[[String]] = [
           ["MEET-UP PLACES",       "SM Baguio City, Pines Resto"],
           ["MEET-UP DAYS",      "Monday to Friday"],
           ["MEET-UP TIME",        "8 am to 6 m"],
           ["CONTACT INFO", "+63 222 3383 2795"]
       ]
    let colorArray = [UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink]
    /// album of swappable things
    let albumArray = [["My Collections", "123"],
                      ["Shoes", "12"],
                      ["Smartphones", "23"],
                      ["Toys", "111"],
                      ["Computers", "50"],
                      ["Tablets", "43"],
                      ["Shoes", "12"],
                    ["Smartphones", "23"],
                    ["Toys", "111"],
                    ["Computers", "50"],
                    ["Tablets", "43"]
    ]
    /// collection of swappable things
    let collectionArray = ["Collection", "Collection","Collection","Collection","Collection","Collection"]
  
    lazy var mainSegment: UISegmentedControl = {
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
        cv.register(CollectionCell.self, forCellWithReuseIdentifier: collectionCellID)
        cv.register(AlbumCell.self, forCellWithReuseIdentifier: albumCellID)
        
        cv.register(SegmentedCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: segmentedCellID)
        return cv
    }()
    
    
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
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addBtnPressed))
        navigationItem.rightBarButtonItem = addItem
//        mainSegnment.frame(forAlignmentRect: CGRect(x: 0, y: -50, width: 44, height: 44))
//        let sc = UIBarButtonItem(customView: mainSegnment)
//        sc.customView?.frame(forAlignmentRect: CGRect(x: -50, y: -50, width: 44, height: 44))
//        navigationItem.rightBarButtonItem =  sc
        
    }
    
    @objc func addBtnPressed() {

        switch mainSegment.selectedSegmentIndex {
        case 0:
            let addCollection = AddPostVC()
            
            self.navigationController?.pushViewController(addCollection, animated: true)
//            present(addCollection, animated: true)
            print("collection")
        case 1:
            print("album")
            addAlbumAndCollection()
        default:
            print("collection")
        }
    }
  
    @objc func profileImagePressed(){
        let userProfileVC = UserProfileVC()
        userProfileVC.modalPresentationStyle = .fullScreen
        self.present(userProfileVC, animated: true)
    }
    
    fileprivate func addAlbumAndCollection(){
        
        let alertController = UIAlertController(title: "New Album", message: "Enter a name for this album.", preferredStyle: .alert)
//        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(displayP3Red: 22/255, green: 23/255, blue: 27/255, alpha: 1.5)
//        alertController.view.tintColor = UIColor(displayP3Red: 253/255, green: 39/255, blue: 93/255, alpha: 1)
        
//        let attributedTitle = NSAttributedString(string: alertController.title!, attributes: [
//           NSAttributedString.Key.foregroundColor : UIColor.white
//        ])
//
//        let attributedMessage = NSAttributedString(string: alertController.message!, attributes: [
////            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), //your font here
//            NSAttributedString.Key.foregroundColor : UIColor.white
//        ])
//
//        alertController.setValue(attributedTitle, forKey: "attributedTitle")
//        alertController.setValue(attributedMessage, forKey: "attributedMessage")


        let saveAction = UIAlertAction(title: "Add", style: .default) { [unowned self] action in

        }
                   
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alertController.addTextField { (addTextField) in
        addTextField.placeholder = "Title"
        var txtFld = UITextField()

        txtFld = addTextField
//            addTextField.backgroundColor = .red
//            addTextField.layer.borderColor = .init(srgbRed: 235/255, green: 52/255, blue: 52/255, alpha: 1)
            addTextField.layoutSubviews()
//            txtFld.backgroundColor = .red
//            txtFld.layoutSubviews()
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
       
    func setupCollectionView(){
        [collectionView].forEach({view.addSubview($0)})
        collectionView.backgroundColor = .clear
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15))
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
        
        switch mainSegment.selectedSegmentIndex {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! CollectionCell
    
        switch mainSegment.selectedSegmentIndex {
        case 0:
            cell.backgroundColor = colorArray[indexPath.item]
            cell.backgroundColor = .clear
//            cell.titleLbl.text = collectionArray[indexPath.item]
//            cell.lbl.textColor = .white

//            cell.imageView.anchor(top: cell.topAnchor, leading: cell.leadingAnchor, bottom: cell.bottomAnchor, trailing: cell.trailingAnchor)
            cell.imageView.image = itemImage

            cell.updateConstraints()
            navigationController?.navigationBar.topItem?.title = "My Collections"
        case 1:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: albumCellID, for: indexPath) as! AlbumCell

//            cell.backgroundColor = colorArray[indexPath.item]
            cell2.backgroundColor = .clear
            cell2.titleLbl.text = albumArray[indexPath.item][0]
            cell2.counterLbl.text = albumArray[indexPath.item][1]
            
            cell2.titleLbl.textColor = .white
            cell2.titleLbl.font = .boldSystemFont(ofSize: 18)

            cell2.counterLbl.textColor = .lightGray
            cell2.imageView.image = itemImage
            navigationController?.navigationBar.topItem?.title = "Albums"
            
            return cell2
        default:
//            cell.backgroundColor = .clear
//            cell.backgroundColor = colorArray[indexPath.item]
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
            String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                    segmentedCellID, for: indexPath) as! SegmentedCell
        
        /// added mainSegnment to segnmentedCell (header) subview in other to keep track of the segnment switch right from the MainVC
        header.addSubview(mainSegment)
        header.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        mainSegment.anchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, padding: UIEdgeInsets.init(top: 10, left: 40, bottom: 15, right: 40))
        
            return header
        }
    
    @objc fileprivate func handleSegnmentDidChange(sender: UISegmentedControl){
        /// reload collectionView data when the user switches between segnment
        collectionView.reloadData()

    }
        

        /// header height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 55)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout functions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        if indexPath.item == 0{
//            return CGSize(width: collectionView.frame.width - 15, height: 50)
//        }
        /// changing number of cell in row when user switches through the segnment
        var noOfCellsInRow = 0
        switch mainSegment.selectedSegmentIndex {
        case 0:
            noOfCellsInRow = 3
        case 1:
            noOfCellsInRow = 2
        default:
            break
        }
        
        /// changing sizeForItem when user switches through the segnment
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        switch mainSegment.selectedSegmentIndex {
            case 0:
                return CGSize(width: size, height: size)
            case 1:
                return CGSize(width: size, height: size + 50)
            default:
                break
            }
        return CGSize(width: 0, height: 0)
//        return CGSize(width: (self.collectionView.frame.width/3.0) - 4 , height: (self.collectionView.frame.height/6))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch mainSegment.selectedSegmentIndex {
        case 0:
            return  10
        case 1:
            return  10
        default:
            break
        }
        
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch mainSegment.selectedSegmentIndex {
        case 0:
            return  10
        case 1:
            return  10
        default:
            break
        }
        
        return  0
    }
    
}


import SwiftUI
///config  PreviewProvider
struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return TabController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}
