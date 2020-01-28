//
//  UserInfoCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/27/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class UserInfoCell: UITableViewCell {
    
    
    lazy var infoTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var infoDetails: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .left
        return lb
    }()
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        // Configure the view for the selected state
    }

    fileprivate func setupView(){
        [infoTitle, infoDetails].forEach({contentView.addSubview($0)})
        contentView.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)

        infoTitle.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 5, left: 0, bottom: 0, right: 0))
        
        infoDetails.anchor(top: infoTitle.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 5, left: 0, bottom: 5, right: 0))
    }
}
