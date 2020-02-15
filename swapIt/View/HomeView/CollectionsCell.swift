//
//  collectionsCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/25/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class CollectionsCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.sizeToFit()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    lazy var titleLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
//        lb.textAlignment = .center
        lb.tintColor = .white
        return lb
    }()
    
     lazy var counterLbl: UILabel = {
        let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
    //        lb.textAlignment = .center
            lb.tintColor = .white
            return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    fileprivate func setupView(){
        [imageView, titleLbl, counterLbl].forEach({contentView.addSubview($0)})
        
        imageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 50, right: 0))
        titleLbl.anchor(top: imageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 5, left: 0, bottom: 0, right: 0))
        counterLbl.anchor(top: titleLbl.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
