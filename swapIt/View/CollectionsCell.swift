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
    
    lazy var lbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.tintColor = .white
        return lb
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    fileprivate func setupView(){
        contentView.addSubview(lbl)
        lbl.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
