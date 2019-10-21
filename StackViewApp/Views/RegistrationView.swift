//
//  RegistrationView.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class RegistrationView: UIView {
    lazy var profileImageButton: UIButton = {
        let iv = UIButton(type: .system)
        iv.setTitle("Select Photo", for: .normal)
        iv.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        iv.backgroundColor = .white
        iv.setTitleColor(.black, for: .normal)
        iv.heightAnchor.constraint(equalToConstant: 300).isActive = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    lazy var usernameTextField: CustomTextField = {
        let tf = CustomTextField(padding: 24, height: 40)
        tf.placeholder = "username..."
        tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    lazy var emailTextField: CustomTextField = {
        let tf = CustomTextField(padding: 24, height: 40)
            tf.placeholder = "e.g: john.smith@gmail.com"
         tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let tf = CustomTextField(padding: 24, height: 40)
        tf.isSecureTextEntry = true
        tf.placeholder = "password"
         tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupGradient()
        setupUI()
    }
    
    
    fileprivate func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [
        profileImageButton,
        usernameTextField,
        emailTextField,
        passwordTextField,
        registerButton
        ])
     addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50))
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
    fileprivate func setupGradient() {
        let gradient = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0,1]
        layer.addSublayer(gradient)
        gradient.frame = self.frame
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
