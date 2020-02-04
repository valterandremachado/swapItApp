//
//  AddCollectionVC.swift
//  swapIt
//
//  Created by Valter Andre Machado on 2/2/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools
import SwiftUI

class AddCollectionVC: UIViewController{
    let backButton = UIBarButtonItem()

    
    override func viewDidLoad() {
        view.backgroundColor = .cyan
        setupNavBarBtns()
    }
    
    fileprivate func setupNavBarBtns(){
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let addBtn = UIButton(type: .system)
        addBtn.setTitle("Post", for: .normal)
        addBtn.titleLabel?.font = .boldSystemFont(ofSize: 18)
//        addBtn.backgroundColor = .systemPink
        let barBtn = UIBarButtonItem(customView: addBtn)
        
//        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        navigationItem.rightBarButtonItem = barBtn
    }
    
    
    
    
    
    ///config  PreviewProvider
    struct MainPreview: PreviewProvider {
        static var previews: some View {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
        struct ContainerView: UIViewControllerRepresentable {
            
            func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
                return AddCollectionVC()
            }
            
            func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
                
            }
        }
    }
}
