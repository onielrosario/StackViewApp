//
//  AppUser.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/11/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit


struct User: CardViewModeling {
    let name: String
    let age: Int
    let profession: String
    let imageNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        let attributes = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
               attributes.append(NSAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
                attributes.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        return CardViewModel(imageNames: imageNames, attributes: attributes, textAlignment: .left)
    }
}
