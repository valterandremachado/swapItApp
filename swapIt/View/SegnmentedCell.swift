//
//  SegnmentedCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/26/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class SegnmentedCell: UICollectionViewCell {
     lazy var mainSegnment: UISegmentedControl = {
            let sc = UISegmentedControl(items: ["My Collections", "Albums"])
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.tintColor = .clear
            sc.backgroundColor = .clear
    //        sc.removeBorders()
//            sc.layer.masksToBounds = false
//            sc.clipsToBounds = true
//            sc.layer.borderWidth = 0
//            sc.layer.cornerRadius = 15
            sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    //        sc.sizeToFit()
            sc.selectedSegmentTintColor = UIColor.rgb(red: 235, green: 51, blue: 72)
            sc.selectedSegmentIndex = 0
//            sc.addTarget(self, action: #selector(handleSegnmentDidChange), for: .valueChanged)

            return sc
        }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView(){
        contentView.addSubview(mainSegnment)
        contentView.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        mainSegnment.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 8, left: 40, bottom: 8, right: 40))
    }
    
//    @objc fileprivate func handleSegnmentDidChange(){
//        
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
