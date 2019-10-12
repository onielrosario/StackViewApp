//
//  HomeButtonControlStackView.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class HomeButtonTopControlStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalCentering
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        let buttons = [ #imageLiteral(resourceName: "top_left_profile"),#imageLiteral(resourceName: "app_icon"),#imageLiteral(resourceName: "top_right_messages")].map { (image) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        buttons.forEach { view in
            addArrangedSubview(view)
        }
        
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
