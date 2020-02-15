//
//  SwappyTabCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 2/2/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit

class SwappyCell: UICollectionViewCell {
    
    lazy var timeLineLbl: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .left
        lb.tintColor = .white
        lb.text = "3 hours ago"
//        lb.backgroundColor = .red

        return lb
    }()
    
    lazy var wantsToSwapLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.sizeToFit()
        
        lbl.numberOfLines = 0
        lbl.textAlignment = .justified
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.adjustsFontForContentSizeCategory = true
        lbl.adjustsFontSizeToFitWidth = true
        lbl.backgroundColor = .brown
        return lbl
    }()
    lazy var userNameLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
       //       lbl.text = "This will be your post main photo"
        lbl.textColor = .white
//        lbl.backgroundColor = .gray

        return lbl
    }()
    
    lazy var profileImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//        iv.setRounded()
        return iv
    }()
        
    lazy var imageOneImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var imageTwoImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.layer.borderWidth = 2
        iv.clipsToBounds = true
//        iv.layer.masksToBounds = true

        return iv
    }()
    
    lazy var swapIcone: UIImageView = {
            var iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
    //        iv.layer.borderWidth = 2
//            iv.clipsToBounds = true
    //        iv.layer.masksToBounds = true

            return iv
        }()
    
    lazy var stackViewOne: UIStackView = {
        var sv = UIStackView(arrangedSubviews: [swapIcone])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 0
//        sv.alignment = .top
        sv.distribution = .fillEqually
        sv.addBackground(color: .red)

            return sv
    }()
    lazy var stackView2: UIStackView = {
        var sv = UIStackView(arrangedSubviews: [userNameLbl, timeLineLbl])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 0
//        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.addBackground(color: .red)

        return sv
    }()
    
     lazy var swapStackView: UIStackView = {
            var sv = UIStackView(arrangedSubviews: [imageOneImageView, stackViewOne, imageTwoImageView])
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .horizontal
            sv.spacing = 0
    //        sv.alignment = .center
            sv.distribution = .fillEqually
            sv.addBackground(color: .red)

            return sv
        }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
//        profileImageView.layer.masksToBounds = true
//        profileImageView.clipsToBounds = true
//        profileImageView.layoutIfNeeded()
//        profileImageView.setRounded()

        setupView()
    }
    
    fileprivate func setupView(){
        [profileImageView, stackView2, wantsToSwapLbl, swapStackView].forEach({contentView.addSubview($0)})
        swapIcone.image = UIImage(systemName: "arrow.right.arrow.left")
//        stackViewOne.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0))
       
        profileImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, size: CGSize(width: 45, height: 45))
        
        stackView2.anchor(top: profileImageView.topAnchor, leading: profileImageView.trailingAnchor, bottom: profileImageView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0))
        
        wantsToSwapLbl.anchor(top: stackView2.topAnchor, leading: stackView2.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 22))
        
         swapStackView.anchor(top: profileImageView.bottomAnchor, leading: profileImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 15))
        
//        stackViewOne.anchor(top: nil, leading: swapStackView.trailingAnchor, bottom: nil, trailing: swapStackView.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), size: CGSize(width: 0, height: 22))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
