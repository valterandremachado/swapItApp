//
//  EditUserProfileVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/27/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools
import SwiftUI

class EditUserProfileVC: UINavigationController {
    
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
    
    

    ///config  PreviewProvider
       struct MainPreview: PreviewProvider {
           static var previews: some View {
               ContainerView().edgesIgnoringSafeArea(.all)
           }
           struct ContainerView: UIViewControllerRepresentable {
               
               func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
                   return EditUserProfileVC()
               }
               
               func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
                   
               }
           }
       }
}
