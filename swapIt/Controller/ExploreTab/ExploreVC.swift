//
//  ExploreVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/26/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

let popularCellID = "popularCell"
let recentCellID = "recentCell"
let nearMeCellID = "nearMeCell"



class ExploreVC: UIViewController {
    
    var filteredArray = [String]()
    var isSearching = false
    
    let colorArray = [UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.black, UIColor.black, UIColor.systemPink]
            /// album of swappable things
            let popularArray = ["Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular", "Popular"]
            /// collection of swappable things
            let recentArray = ["Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent", "Recent"]

            let nearMeArray = ["Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me", "Near Me"]
          
            lazy var mainSegmentThree: UISegmentedControl = {
                let sc = UISegmentedControl(items: ["Popular", "Recent", "Near Me"])
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
    
            lazy var searchBars: UISearchBar = {
                let sb = UISearchBar()
//                sb.translatesAutoresizingMaskIntoConstraints = false
                return sb
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
                cv.register(PopularCell.self, forCellWithReuseIdentifier: popularCellID)
                cv.register(RecentCell.self, forCellWithReuseIdentifier: recentCellID)
                cv.register(NearMeCell.self, forCellWithReuseIdentifier: nearMeCellID)

                cv.register(SegmentedCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: segmentedCellID)
                return cv
            }()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
            setNavigationBar()
            setupCollectionView()
        }
        
        func setNavigationBar() {
                navigationController?.navigationBar.topItem?.title = "Explore"
                /// navBar color
//                navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationController?.navigationBar.hideNavBarSeperator()
                /// navBarItem color
                navigationController?.navigationBar.tintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
                /// navBarTitle color
                navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                /// navBar  largeTitle color
                navigationController?.navigationBar.prefersLargeTitles = false
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
        //
        //        /// add profileBtn to UIBarButtonItem on the left side
                let profileItem = UIBarButtonItem(customView: profileBtn)
                navigationItem.leftBarButtonItem =  profileItem
        //
        //        /// add addBtn  to UIBarButtonItem on the right side
//                let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: nil)
//                navigationItem.rightBarButtonItem = addItem
                searchBars = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0))
                searchBars.placeholder = "Search items, collections and etc."
                 UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

                let rightNavBarButton = UIBarButtonItem(customView: searchBars)
                self.navigationItem.rightBarButtonItem = rightNavBarButton


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

extension ExploreVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        
        // MARK: UICollectionViewDataSource functions
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 1
    //    }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            switch mainSegmentThree.selectedSegmentIndex {
            case 0:
                return popularArray.count
            case 1:
                return recentArray.count
            case 2:
                return nearMeArray.count
            default:
                break
            }

            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCellID, for: indexPath) as! PopularCell
        
            switch mainSegmentThree.selectedSegmentIndex {
            case 0:
                cell.backgroundColor = colorArray[indexPath.item]
                cell.lbl.text = popularArray[indexPath.item]
                cell.lbl.textColor = .white
                navigationController?.navigationBar.topItem?.title = "Popular"
            case 1:
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: recentCellID, for: indexPath) as! RecentCell
                cell2.backgroundColor = colorArray[indexPath.item]
//                cell.lbl.text = recentArray[indexPath.item]
//                cell.lbl.textColor = .white
                navigationController?.navigationBar.topItem?.title = "Recent"
                
                return cell2
            case 2:
                let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: nearMeCellID, for: indexPath) as! NearMeCell
                cell3.backgroundColor = colorArray[indexPath.item]
//                cell.lbl.text = nearMeArray[indexPath.item]
//                cell.lbl.textColor = .white
                navigationController?.navigationBar.topItem?.title = "Near Me"
                
                return cell3
            default:
                cell.backgroundColor = colorArray[indexPath.item]
                break
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
                String, at indexPath: IndexPath) -> UICollectionReusableView {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                        segmentedCellID, for: indexPath) as! SegmentedCell
            
            /// added mainSegnment to segnmentedCell (header) subview in other to keep track of the segnment switch right from the MainVC
            header.addSubview(mainSegmentThree)
            header.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

            mainSegmentThree.anchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, padding: UIEdgeInsets.init(top: 20, left: 40, bottom: 15, right: 40))
            
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
            switch mainSegmentThree.selectedSegmentIndex {
            case 0:
//                if indexPath.section == 0 {
//                    noOfCellsInRow = 2
//
//                }
                noOfCellsInRow = 3
            case 1:
                noOfCellsInRow = 2
            case 2:
                noOfCellsInRow = 3
            default:
                break
            }
            /// changing sizeForItem when user switches through the segnment
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            switch mainSegmentThree.selectedSegmentIndex {
                case 0:
                    if indexPath.item == 1 {
                        return CGSize(width: size + size + 10, height: size)

                    }
                    return CGSize(width: size, height: size)
                case 1:
                    return CGSize(width: size, height: size + 20)
                case 2:
                    return CGSize(width: size, height: size)
                default:
                    break
                }
            return CGSize(width: 0, height: 0)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
            switch mainSegmentThree.selectedSegmentIndex {
                case 0:
                    return  10
                case 1:
                    return  15
                case 2:
                    return  10
                default:
                    break
                }
                   
            return  0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            switch mainSegmentThree.selectedSegmentIndex {
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
struct MainPreview3: PreviewProvider {
    static var previews: some View {
        ContainerView3().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView3: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview3.ContainerView3>) -> UIViewController {
            return ExploreVC()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview3.ContainerView3.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview3.ContainerView3>) {
            
        }
    }
}
