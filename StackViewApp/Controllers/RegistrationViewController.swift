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
        view.backgroundColor = .red
    }
}
