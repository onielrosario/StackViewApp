//
//  Advertiser.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/11/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit


struct Advertisement: CardViewModeling {
    let title: String
    let brandName: String
    let posterPhotoName: String
    
    func toCardViewModel() -> CardViewModel {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 34, weight: .heavy)])
        attributedString.append(NSAttributedString(string: "\n" + brandName, attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .bold)]))
        return CardViewModel(imageNames: [posterPhotoName], attributes: attributedString, textAlignment: .center)
    }
}
