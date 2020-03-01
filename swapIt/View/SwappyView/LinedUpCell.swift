//
//  LinedUpCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 2/23/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit

class LinedUpCell: UICollectionViewCell {
    

        lazy var timeLbl: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textAlignment = .left
            lbl.tintColor = .white
            lbl.text = "(9:30 AM"
            lbl.font = UIFont.boldSystemFont(ofSize: 11)
            lbl.textColor = .gray

    //        lbl.backgroundColor = .red

            return lbl
        }()
        
        lazy var dateLbl: UILabel = {
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
        lazy var tradeProgressLbl: UILabel = {
            var lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
           //       lbl.text = "This will be your post main photo"
            lbl.textColor = .white
    //        lbl.backgroundColor = .gray
            lbl.font = UIFont.boldSystemFont(ofSize: 15)


            return lbl
        }()
        
            
        lazy var imageOneImageView: UIImageView = {
            var iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.clipsToBounds = true
            iv.sizeToFit()
            iv.layer.cornerRadius = 10
            return iv
        }()
        
        lazy var imageTwoImageView: UIImageView = {
            var iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
    //        iv.layer.borderWidth = 2
            iv.clipsToBounds = true
    //        iv.layer.masksToBounds = true
            iv.sizeToFit()
            iv.layer.cornerRadius = 10

            return iv
        }()
        
        lazy var swapIcone: UIImageView = {
                var iv = UIImageView()
            let swapIcon = UIImage(systemName: "arrow.right.arrow.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .heavy))
            let swapIconWithColor = swapIcon?.withTintColor(UIColor(displayP3Red: 235/255, green: 51/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)

            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.image = swapIconWithColor
//            let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .black, scale: .small)
//            let image = UIImage(systemName: "arrow.right.arrow.left", withConfiguration: imageConfig)
//            iv.withHeight(10)
//            iv.backgroundColor = .red
            
            return iv
        }()
        
        lazy var stackView: UIStackView = {
            var sv = UIStackView(arrangedSubviews: [imageOneImageView, swapIcone, imageTwoImageView])
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .horizontal
            sv.spacing = 5
//            sv.contentMode = .scaleToFill
            sv.alignment = .center
            sv.distribution = .equalSpacing
            sv.addBackground(color: .blue)

            return sv
        }()
    
    lazy var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
        
        lazy var separatorView: UIView = {
            let view = UIView()
//            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
//        setupView()
    }
//
    override func layoutSubviews() {
            super.layoutSubviews()
            DispatchQueue.main.async {
                self.setupView()
//                self.imageTwoImageView.setRounded()
//                self.imageOneImageView.setRounded()
            }

        }
    
    fileprivate func setupView(){
        [containerView].forEach({contentView.addSubview($0)})
//        swapIcone.withHeight(20)
//        [imageOneImageView, swapIcone, imageTwoImageView].forEach({containerView.addSubview($0)})
        containerView.addSubview(stackView)
//        stackView.addArrangedSubview(imageOneImageView)
//        stackView.addArrangedSubview(swapIcone)
//        stackView.addArrangedSubview(imageTwoImageView)
//        swapIcone.withSize(CGSize.init(width: 0, height: 10))
        
        imageOneImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageOneImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true

        imageTwoImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageTwoImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true

        swapIcone.widthAnchor.constraint(equalToConstant: 20).isActive = true
        swapIcone.heightAnchor.constraint(equalToConstant: 20).isActive = true
        

//        stackView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor, constant: 10).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor, constant: 10).isActive = true

        stackView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor, constant: contentView.frame.width/4).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor, constant: contentView.frame.height/2).isActive = true
//        let screenSize: CGRect = UIScreen.main.bounds
//        swapIcone.frame = CGRect(x: 0,y: 0, width: screenSize.height * 0.2, height: 10)
//        stackView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 0), size: CGSize(width: frame.width/2.6, height: 0))
//        stackView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
//
//        imageOneImageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: swapIcone.leadingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0), size: CGSize(width: 0, height: 0))
//
//        swapIcone.anchor(top: containerView.topAnchor, leading: imageOneImageView.trailingAnchor, bottom: containerView.bottomAnchor, trailing: imageTwoImageView.leadingAnchor, padding: UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5), size: CGSize(width: 5, height: 0))
//
//        imageTwoImageView.anchor(top: containerView.topAnchor, leading: swapIcone.trailingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 5), size: CGSize(width: 0, height: 0))
        
//        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
//         containerView.translatesAutoresizingMaskIntoConstraints = false
//            let horizontalConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
//            let verticalConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
//
//        let widthConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: frame.width/2)
//            let heightConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//            contentView.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
