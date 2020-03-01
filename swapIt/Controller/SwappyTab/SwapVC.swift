//
//  SwapVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/26/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

let imageOne = UIImage(named: "lebron17.jpeg")
let imageTwo = UIImage(named: "harden4.jpeg")

let swappablesCellID = "swapCell"
let offersCellID = "offersCell"
let linedUpCellID = "linedUpCell"

class SwapVC: UIViewController {
    
    let colorArray = [UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink]
        /// album of swappable things
        let swappableArray = ["Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables", "Swappables"]
        /// collection of swappable things
        let offerArray = ["Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers", "Offers"]

        let linedupArray = ["Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up", "Lined Up"]
      
        lazy var mainSegmentTwo: UISegmentedControl = {
            let sc = UISegmentedControl(items: ["Swappables", "Offers", "Lined Up"])
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.tintColor = .clear
            sc.backgroundColor = .clear
    //        sc.removeBorders()
            sc.layer.borderWidth = 0
            sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    //        sc.sizeToFit()
            sc.selectedSegmentTintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
            sc.selectedSegmentIndex = 2
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
            cv.register(OffersCell.self, forCellWithReuseIdentifier: offersCellID)
            cv.register(SwappablesCell.self, forCellWithReuseIdentifier: swappablesCellID)
            cv.register(LinedUpCell.self, forCellWithReuseIdentifier: linedUpCellID)
            
            cv.register(SegmentedCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: segmentedCellID)
            return cv
        }()
    let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        setNavigationBar()
        setupCollectionView()
    }
    
    
    func setNavigationBar() {
            navigationController?.navigationBar.topItem?.title = "Swappy"
            /// navBar color
//            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.hideNavBarSeperator()
            /// navBarItem color
            navigationController?.navigationBar.tintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
            /// navBarTitle color
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            /// navBar  largeTitle color
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .automatic
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
            let profileImage = UIImage.init(named: "millie.jpg")
    //        /// profileBtn instance
            let profileBtn = UIButton(type: .custom)
            profileBtn.setImage(profileImage, for: .normal)
            profileBtn.imageView?.contentMode = .scaleAspectFill
            profileBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            profileBtn.layer.cornerRadius = profileBtn.frame.size.height/2
            profileBtn.layer.masksToBounds = false
            profileBtn.clipsToBounds = true
//            profileBtn.layer.borderWidth = 1.0
            profileBtn.layer.borderColor = UIColor.red.cgColor

    //        /// height and width constrainnts of profileBtn
            let widthConstraint = profileBtn.widthAnchor.constraint(equalToConstant: 30)
            let heightConstraint = profileBtn.heightAnchor.constraint(equalToConstant: 30)
            heightConstraint.isActive = true
            widthConstraint.isActive = true
            profileBtn.addTarget(self, action: #selector(profileImagePressed), for: .touchUpInside)
        
        
    //        /// add profileBtn to UIBarButtonItem on the left side
            let profileItem = UIBarButtonItem(customView: profileBtn)
            navigationItem.leftBarButtonItem =  profileItem
    //
    //        /// add addBtn  to UIBarButtonItem on the right side
//        if mainSegnmentTwo.selectedSegmentIndex == 1 {
//            navigationController?.navigationBar.isHidden = true
//
//        }
//        switch mainSegnmentTwo.selectedSegmentIndex {
//        case 0:
//            print("0")
//        case 1:
//            print("1")
//            navigationController?.navigationBar.isHidden = true
//        case 2:
//            print("2")
//        default:
//            print("0")
//            break
//        }
    }
    
    func setupCollectionView(){
            [collectionView].forEach({view.addSubview($0)})
            collectionView.backgroundColor = .clear
            
            collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15))
    //        collectionView.layoutIfNeeded()
    }
    
    @objc func profileImagePressed(){
           let userProfileVC = UserProfileVC()
           userProfileVC.modalPresentationStyle = .fullScreen
           self.present(userProfileVC, animated: true)
    }
    
    @objc func addBtnPressed() {

//            switch mainSegnmentTwo.selectedSegmentIndex {
//            case 0:
//                let addCollection = AddCollectionVC()
//
//                self.navigationController?.pushViewController(addCollection, animated: true)
//    //            present(addCollection, animated: true)
//                print("collection")
//            case 1:
////                addAlbumAndCollection()
//            default:
//                print("collection")
//            }
        }
}

extension SwapVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource functions
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch mainSegmentTwo.selectedSegmentIndex {
        case 0:
            return swappableArray.count
        case 1:
            return offerArray.count
        case 2:
            return linedupArray.count
        default:
            break
        }

        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: swappablesCellID, for: indexPath) as! SwappablesCell
    
        switch mainSegmentTwo.selectedSegmentIndex {
        case 0:
            
            cell.backgroundColor = colorArray[indexPath.item]
//            cell.lbl.text = swappableArray[indexPath.item]
//            cell.lbl.textColor = .white
            navigationController?.navigationBar.topItem?.title = "Swappables"
            navigationItem.rightBarButtonItem = addItem


        case 1:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: offersCellID, for: indexPath) as! OffersCell
//            cell.backgroundColor = colorArray[indexPath.item]
//            cell.lbl.text = offerArray[indexPath.item]
//            cell.lbl.textColor = .white
            cell2.profileImageView.image = imageOne
            cell2.userNameLbl.text = "Millie Bobby"
            cell2.wantsToSwapLbl.text = "wants to swap with your item"
            cell2.imageOneImageView.image = imageOne
            cell2.imageTwoImageView.image = imageTwo
            cell2.separatorView.backgroundColor = .darkGray

            navigationController?.navigationBar.topItem?.title = "Offers"
            navigationItem.rightBarButtonItem = nil
            return cell2
        case 2:
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: linedUpCellID, for: indexPath) as! LinedUpCell
            cell3.backgroundColor = colorArray[indexPath.item]
//            cell.lbl.text = linedupArray[indexPath.item]
//            cell.lbl.textColor = .white
            cell3.imageOneImageView.image = imageOne
            cell3.imageTwoImageView.image = imageTwo
            cell3.containerView.backgroundColor = .darkGray
//            cell3.stackView.addBackground(color: .red)
            navigationController?.navigationBar.topItem?.title = "Lined Up"

            navigationItem.rightBarButtonItem = nil
            
            return cell3

        default:
            navigationItem.rightBarButtonItem = addItem
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
        header.addSubview(mainSegmentTwo)
        header.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        mainSegmentTwo.anchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, padding: UIEdgeInsets.init(top: 20, left: 40, bottom: 15, right: 40))
        
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
        
        /// changing number of cell in row when user switches through the segnment
        var noOfCellsInRow = 0
        switch mainSegmentTwo.selectedSegmentIndex {
        case 0:
            noOfCellsInRow = 3
        case 1:
            noOfCellsInRow = 1
        case 2:
            noOfCellsInRow = 1
        default:
            break
        }
        
        /// changing sizeForItem when user switches through the segnment
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        switch mainSegmentTwo.selectedSegmentIndex {
            case 0:
                return CGSize(width: size, height: size)
            case 1:
                return CGSize(width: size, height: size - 160)
            case 2:
                return CGSize(width: size, height: size - 260)
            default:
                break
            }
        return CGSize(width: 0, height: 0)
//        return CGSize(width: (self.collectionView.frame.width/3.0) - 4 , height: (self.collectionView.frame.height/6))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch mainSegmentTwo.selectedSegmentIndex {
                case 0:
                    return  10
                case 1:
                    return  10
                case 2:
                    return  10
                default:
                    break
                }
            return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch mainSegmentTwo.selectedSegmentIndex {
            case 0:
                return  10
            case 1:
                return  10
            case 2:
                return  10
            default:
                break
            }
        return  0
    }
    
}

import SwiftUI
///config  PreviewProvider
struct MainPreview2: PreviewProvider {
    static var previews: some View {
        ContainerView2().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView2: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview2.ContainerView2>) -> UIViewController {
            return SwapVC()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview2.ContainerView2.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview2.ContainerView2>) {
            
        }
    }
}
