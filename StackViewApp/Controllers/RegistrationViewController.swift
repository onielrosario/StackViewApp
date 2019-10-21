//
//  RegistrationViewController.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/18/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    let registrationView = RegistrationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registrationView)
       setupNotification()
    }
    
    fileprivate func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.cgRectValue
        
        self.view.transform = CGAffineTransform(scaleX: 0, y: -keyboardFrame.height)
    }
}
