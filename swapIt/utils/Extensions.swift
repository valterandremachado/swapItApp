//
//  Extensions.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/25/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.layer.borderWidth = 4.0
    self.layer.borderColor = UIColor.rgb(red: 235, green: 51, blue: 72) as! CGColor
   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
   self.image = anyImage
  }
}

