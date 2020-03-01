//
//  AddCollectionCell.swift
//  swapIt
//
//  Created by Valter Andre Machado on 2/5/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools

class PostTVMainCell: UITableViewCell {
    
    lazy var titleLbl: UILabel = {
          let lb = UILabel()
          lb.translatesAutoresizingMaskIntoConstraints = false
          lb.textAlignment = .left
          return lb
      }()
      
      lazy var txtFld: UITextField = {
          let tf = UITextField()
          tf.translatesAutoresizingMaskIntoConstraints = false
//          tf.textAlignment = .left
        tf.textColor = .white
          return tf
      }()
      

      
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
             super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
         }
         
         required init?(coder aDecoder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }

      fileprivate func setupView(){
          [titleLbl, txtFld].forEach({contentView.addSubview($0)})
          contentView.backgroundColor = UIColor.rgb(red: 22, green: 23, blue: 27)
        titleLbl.textColor = .lightGray
        titleLbl.anchor(top: contentView.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 5, left: contentView.frame.width/16, bottom: 0, right: 0))
          
        txtFld.anchor(top: titleLbl.bottomAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: contentView.frame.width/16, bottom: 5, right: 0))
      }
}
