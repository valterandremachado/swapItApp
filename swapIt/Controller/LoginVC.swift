//
//  ViewController.swift
//  swapIt
//
//  Created by Valter Andre Machado on 1/23/20.
//  Copyright © 2020 Valter Andre Machado. All rights reserved.
//

import UIKit
import LBTATools


class LoginVC: UIViewController {
    
    let imageBackground = UIImage(named: "balance.jpg")
    var imageView : UIImageView!

    lazy var logoLabel: UILabel = {
        var lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "SwapIt"
//        lb.font = UIFont(name: "Billabong", size: 50)
        lb.font = UIFont(name: "Bunch Blossoms Personal Use", size: 50)
//        lb.font = .boldSystemFont(ofSize: 50)
        lb.textAlignment = .center
        lb.textColor = .white
//        lb.backgroundColor = .gray
        return lb
    }()
  
    lazy var separatorOne: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var separatorTwo: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        return view
    }()
    
    lazy var emailTxtFld: UITextField = {
        var txtFld = UITextField()
        txtFld.translatesAutoresizingMaskIntoConstraints = false
//        txtFld.backgroundColor = .blue
         let placeholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        txtFld.attributedPlaceholder = placeholder
//        txtFld.placeholder = "Email"
//        txtFld.borderStyle = .roundedRect
        txtFld.textAlignment = .center
        txtFld.textColor = .white

        return txtFld
    }()
    
    lazy var passwordTxtFld: UITextField = {
        var txtFld = UITextField()
        txtFld.translatesAutoresizingMaskIntoConstraints = false
//        txtFld.backgroundColor = .red
//        txtFld.borderStyle = .roundedRect
        let placeholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        txtFld.attributedPlaceholder = placeholder
        txtFld.textAlignment = .center
        txtFld.textColor = .white
        txtFld.isSecureTextEntry = true


        return txtFld
    }()
    
    lazy var loginBtn: UIButton = {
        var btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(displayP3Red: 235/255, green: 51/255, blue: 72/255, alpha: 1)
        btn.setTitle("Log In", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 10
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var noAccLbl: UILabel = {
          var lb = UILabel()
          lb.translatesAutoresizingMaskIntoConstraints = false
          lb.text = "Don't have an account?"
//          lb.font = .boldSystemFont(ofSize: 50)
          lb.textAlignment = .right
        lb.textColor = .white
//        lb.sizeToFit()
//          lb.backgroundColor = .gray
          return lb
      }()
    
    lazy var signupLinkBtn: UIButton = {
        var btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = .red
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.textAlignment = .right
        btn.tintColor = UIColor(displayP3Red: 235/255, green: 51/255, blue: 72/255, alpha: 1)

//        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
//        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(signupLinkPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var loginStackView: UIStackView = {
        var sv = UIStackView(arrangedSubviews: [emailTxtFld, passwordTxtFld, loginBtn])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 30
        sv.distribution = .equalSpacing
        return sv
    }()
    
    lazy var labelsStackView: UIStackView = {
        var sv = UIStackView(arrangedSubviews: [noAccLbl, signupLinkBtn])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .equalSpacing
//        sv.backgroundColor = .blue

        return sv
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        assignbackground()
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "balance.jpg")!)
    }
    
    @objc func signupLinkPressed(){
        let signupVC = SignupVC()
        self.present(signupVC, animated: true)
    }
    
    @objc func loginBtnPressed(){
        let mainVC = MainVC()
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
    
    fileprivate func assignbackground(){
        let background = UIImage(named: "AbstractDark.jpg")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
       }
    
    fileprivate func setupView(){
        [logoLabel,loginStackView, labelsStackView, separatorOne, separatorTwo].forEach({view.addSubview($0)})
//        view.sendSubviewToBack(imageView)
       
        logoLabel.anchor(top: nil, leading: loginStackView.leadingAnchor, bottom: loginStackView.topAnchor, trailing: loginStackView.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 10, right: 0))
        
        loginStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: view.frame.height/3, left: 25, bottom: 0, right: 25))
        
        labelsStackView.anchor(top: nil, leading: loginStackView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: loginStackView.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: view.frame.width/6.4, bottom: 0, right: view.frame.width/6.4)
        )
        
//        imageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)

        loginBtn.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: CGSize.init(width: 0, height: 45))
        separatorOne.anchor(top: emailTxtFld.bottomAnchor, leading: loginStackView.leadingAnchor, bottom: nil, trailing: loginStackView.trailingAnchor, size: CGSize.init(width: 0, height: 1))
        
        separatorTwo.anchor(top: passwordTxtFld.bottomAnchor, leading: loginStackView.leadingAnchor, bottom: nil, trailing: loginStackView.trailingAnchor, size: CGSize.init(width: 0, height: 1))
//
//         passwordTxtFld.anchor(top: emailTxtFld.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
//
//         loginBtn.anchor(top: passwordTxtFld.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
    }


}

