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

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

func setTitle(title:String, subtitle:String) -> UIView {
    let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))

    titleLabel.backgroundColor = UIColor.clear
    titleLabel.textColor = UIColor.gray
    titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
    titleLabel.text = title
    titleLabel.sizeToFit()

    let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
    subtitleLabel.backgroundColor = UIColor.clear
    subtitleLabel.textColor = UIColor.black
    subtitleLabel.font = UIFont.systemFont(ofSize: 12)
    subtitleLabel.text = subtitle
    subtitleLabel.sizeToFit()

    let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
    titleView.addSubview(titleLabel)
    titleView.addSubview(subtitleLabel)

    let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width

    if widthDiff < 0 {
        let newX = widthDiff / 2
        subtitleLabel.frame.origin.x = abs(newX)
    } else {
        let newX = widthDiff / 2
        titleLabel.frame.origin.x = newX
    }

    return titleView
}

import UIKit

class HomeController: UIViewController {

    var currentViewController:UIViewController?

     var homeController: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let initialController:UIViewController = self.viewControllerForSegmentedIndex(index: 0)

        self.addChild(initialController)

        initialController.view.frame = self.homeController.bounds
        self.homeController.addSubview(initialController.view)
        self.currentViewController = initialController

    }

    func segmentChanged(sender: UISegmentedControl) {

        let viewCOntroller:UIViewController = viewControllerForSegmentedIndex(index: sender.selectedSegmentIndex)

        self.addChild(viewCOntroller)

        self.transition(from: self.currentViewController!, to: viewCOntroller, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromBottom, animations: {
            self.currentViewController?.view.removeFromSuperview()
            viewCOntroller.view.frame = self.homeController.bounds
            self.homeController.addSubview(viewCOntroller.view)

            }, completion:{ finished in

                viewCOntroller.didMove(toParent: self)
                self.currentViewController?.removeFromParent()
                self.currentViewController = viewCOntroller

        })

    }
    func viewControllerForSegmentedIndex(index:Int) -> UIViewController {
        var viewController:UIViewController?
        switch index {
        case 0:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "StoryboardIdForFirstController")
            break
        case 1:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "StoryboardIdForSecondController")
            break
        case 2:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "StoryboardIdForThirdController")
            break
        default:
            break
        }
        return viewController!
    }
}
