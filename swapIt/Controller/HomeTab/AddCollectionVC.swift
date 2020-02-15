//
//  AddCollectionVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 2/2/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools
import SwiftUI



let addCollectionCellID = "addCollectionID"
let headeID = "headerId"
let postImageCellID = "postImageID"
let defautImage = UIImage(systemName: "plus.circle.fill")

class AddCollectionVC: UIViewController{
    
//    let items = [
//        ["PRODUCT NAME", "DESCRIPTION"],
//        ["SERIES", "MANUFACTURE", "CATEGORY", "PRICE", "RELEASE DATE", "SPECIFICATION"],
//        ["SERIES", "MANUFACTURE", "CATEGORY", "PRICE"]
//    ]
    let firstHeaderArray = ["PRODUCT NAME", "DESCRIPTION"]
    let productDetailArray = ["SERIES", "MANUFACTURE", "CATEGORY", "PRICE", "RELEASE DATE", "SPECIFICATION"]
//    let originArray = ["NAME", "NAME"]
    
    let sections = ["","", "Product Details"]
    
    
    let backButton = UIBarButtonItem()
    lazy var myView = UIView()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(AddCollectionCell.self, forCellReuseIdentifier: addCollectionCellID)
        return tv
    }()
    
    lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            /// makes the header stick on top
            layout.sectionHeadersPinToVisibleBounds = true

//            layout.minimumLineSpacing = 10
//            layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 18, bottom: 0, right: 18)
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.showsVerticalScrollIndicator = false
            cv.backgroundColor = .white
            cv.dataSource = self
            cv.delegate = self
            // preferredContentSize = layout.itemSize
            /// registering cell
            cv.register(ImagePostCell.self, forCellWithReuseIdentifier: postImageCellID)

            return cv
        }()
    lazy var stackView: UIStackView = {
            var sv = UIStackView(arrangedSubviews: [collectionView])
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .horizontal
//            sv.spacing = 0
            sv.distribution = .equalSpacing
    //        sv.backgroundColor = .blue

            return sv
        }()

    
    override func viewDidLoad() {
//        view.backgroundColor = .cyan
        view.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        setupNavBarBtns()
        setupView()
        myView.addDashedBorder()


    }
    
    fileprivate func setupNavBarBtns(){
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let addBtn = UIButton(type: .system)
        addBtn.setTitle("Post", for: .normal)
        addBtn.titleLabel?.font = .boldSystemFont(ofSize: 18)
//        addBtn.backgroundColor = .systemPink
        let barBtn = UIBarButtonItem(customView: addBtn)
        
//        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        navigationItem.rightBarButtonItem = barBtn
    }
    
    ///config  PreviewProvider
    struct MainPreview: PreviewProvider {
        static var previews: some View {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
        struct ContainerView: UIViewControllerRepresentable {
            
            func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
                return AddCollectionVC()
            }
            
            func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
                
            }
        }
    }
}

extension AddCollectionVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postImageCellID, for: indexPath) as! ImagePostCell
        cell.addDashedBorder()
//        cell.backgroundColor = .red
        if indexPath.item == 0
        {
//            let largeConfig = UIImage.SymbolConfiguration(textStyle: .body)
//            cell.imageView.backgroundColor = .red
            cell.imageView.image = defautImage
//            cell.imageView.sizeThatFits(CGSize.init(width: 10, height: 10))
            cell.label.text = "This will be your post main photo"
        }
        else
        {
            cell.imageView.image = defautImage
        }

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 4

        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let viewframe = Int(view.frame.width)
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        if indexPath.item == 0 {
            return CGSize(width: viewframe - 70, height: size + 250)
        }
        return CGSize(width: size, height: size)

    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let lbl = UILabel()
//        lbl.text = "Header"
//        lbl.backgroundColor = .red
//        return lbl
//    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return items.count
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
//            self.tableView.rowHeight = UITableView.automaticDimension
//            self.tableView.estimatedRowHeight = 600
//            tableView.rowHeight = 100
            return 1
        }
        else if section == 1 {
            return firstHeaderArray.count
        }
        else if section == 2 {
            return productDetailArray.count
        }
//        else if section == 3 {
//            return originArray.count
//        }
//        return itemsTwo.count
//        return items[section].count - 3
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if indexPath.section == 0 {
            height = view.frame.height/2
//            1.8
        }
        else {
            height = view.frame.height/16
        }

        return height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: addCollectionCellID, for: indexPath) as! AddCollectionCell

//        let item = items[indexPath.row]
//        let item = indexPath.section == 0 ? items[indexPath.row] : itemsTwo[indexPath.row]
        if indexPath.section == 0 {
            cell.addSubview(collectionView)
            collectionView.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

            
//            collectionView.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.width + 110)

            collectionView.anchor(top: cell.topAnchor, leading: cell.leadingAnchor, bottom: cell.bottomAnchor, trailing: cell.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        else if indexPath.section == 1 {
//            cell.txtFld.backgroundColor = .red
//            cell.textLabel?.text = firstHeaderArray[indexPath.row]
            cell.titleLbl.text = firstHeaderArray[indexPath.row]

        }
        else if indexPath.section == 2 {
//            cell.txtFld.backgroundColor = .red
//            cell.textLabel?.text = productDetailArray[indexPath.row]
            cell.titleLbl.text = productDetailArray[indexPath.row]
//            cell.titleLbl.insetsLayoutMarginsFromSafeArea = true

//            cell.textLabel?.text = " section: \(indexPath.section) row: \(indexPath.row)"
        }
//        else if indexPath.section == 3 {
//            cell.txtFld.isHidden = true
//            cell.textLabel?.text = " section: \(indexPath.section) row: \(indexPath.row)"
//            cell.textLabel?.text = originArray[indexPath.row]
//        }
        //        let item = items[indexPath.section][indexPath.row]
//        cell.textLabel?.text = item
//        cell.titleLbl.text = "\(item) section: \(indexPath.section) row: \(indexPath.row)"
        
        
        return cell
    }
    
    
   
    
    fileprivate func setupView(){
            [tableView].forEach({view.addSubview($0)})
        tableView.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        navigationController?.navigationBar.prefersLargeTitles = false
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15))
    //        myView.backgroundColor = .red
    //        myView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    //        myView.translatesAutoresizingMaskIntoConstraints = true
    //        myView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: view.frame.height/1.2, left: view.frame.width/5, bottom: view.frame.height/5, right: view.frame.width/5))
        }
}







