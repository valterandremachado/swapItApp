//
//  SwappyTabCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 2/2/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class OffersCell: UICollectionViewCell {
    
    lazy var timeLineLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.tintColor = .white
        lbl.text = "3 hours ago"
        lbl.font = UIFont.boldSystemFont(ofSize: 11)
        lbl.textColor = .gray

//        lbl.backgroundColor = .red

        return lbl
    }()
    
    lazy var wantsToSwapLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.sizeToFit()
        
//        lbl.numberOfLines = 0
//        lbl.textAlignment = .justified
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
//        lbl.adjustsFontForContentSizeCategory = true
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.backgroundColor = .brown
        lbl.textColor = .gray
        return lbl
    }()
    lazy var userNameLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
       //       lbl.text = "This will be your post main photo"
        lbl.textColor = .white
//        lbl.backgroundColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: 15)


        return lbl
    }()
    
    lazy var profileImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//        iv.setRounded()
        iv.clipsToBounds = true
        
        return iv
    }()
        
    lazy var imageOneImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.sizeToFit()
        return iv
    }()
    
    lazy var imageTwoImageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.layer.borderWidth = 2
        iv.clipsToBounds = true
//        iv.layer.masksToBounds = true
        iv.sizeToFit()

        return iv
    }()
    
    lazy var swapIcone: UIImageView = {
            var iv = UIImageView()
        let swapIcon = UIImage(systemName: "arrow.right.arrow.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .heavy))
        let swapIconWithColor = swapIcon?.withTintColor(UIColor(displayP3Red: 235/255, green: 51/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)

        iv.translatesAutoresizingMaskIntoConstraints = false
    //        iv.layer.borderWidth = 2
//            iv.clipsToBounds = true
    //        iv.layer.masksToBounds = true
        iv.image = swapIconWithColor
//        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .black, scale: .large)
//        let image = UIImage(systemName: "delete.right", withConfiguration: imageConfig)
        return iv
    }()
    
    lazy var stackView2: UIStackView = {
        var sv = UIStackView(arrangedSubviews: [userNameLbl, wantsToSwapLbl])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 5
//        sv.alignment = .center
        sv.distribution = .equalSpacing
//        sv.addBackground(color: .red)

        return sv
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
     
    override func layoutSubviews() {
//        super.layoutSubviews()
        DispatchQueue.main.async {
            self.profileImageView.setRounded()
            self.imageOneImageView.layer.cornerRadius = 15
            self.imageTwoImageView.layer.cornerRadius = 15
        }

    }
    fileprivate func setupView(){
        [profileImageView, stackView2, timeLineLbl, imageOneImageView, imageTwoImageView, swapIcone, separatorView].forEach({contentView.addSubview($0)})
        
//        var imageWidth: CGFloat = CGFloat()

        separatorView.anchor(top: nil, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 0.5))
        
        profileImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, size: CGSize(width: 40, height: 40))
        
        stackView2.anchor(top: profileImageView.topAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 4, left: 5, bottom: 0, right: 0))
        
        timeLineLbl.anchor(top: stackView2.bottomAnchor, leading: stackView2.leadingAnchor, bottom: profileImageView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0), size: CGSize(width: 0, height: 15))
        
        imageOneImageView.anchor(top: profileImageView.bottomAnchor, leading: profileImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0), size: CGSize(width: 150, height: 0))
        
        swapIcone.anchor(top: imageOneImageView.topAnchor, leading: imageOneImageView.trailingAnchor, bottom: imageOneImageView.bottomAnchor, trailing: imageTwoImageView.leadingAnchor, padding: UIEdgeInsets(top: 60, left: 5, bottom: 60, right: 5))
        
        imageTwoImageView.anchor(top: imageOneImageView.topAnchor, leading: nil, bottom: imageOneImageView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10), size: CGSize(width: 150, height: 0))
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
