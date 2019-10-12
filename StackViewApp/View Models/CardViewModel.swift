//
//  CardViewModel.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/11/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

protocol CardViewModeling {
    func toCardViewModel() -> CardViewModel
}

class CardViewModel {
    let imageNames: [String]
    let attributes: NSAttributedString
    let textAlignment: NSTextAlignment
    
   fileprivate var imageIndex = 0
    
    
    
    init(imageNames: [String], attributes: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributes = attributes
        self.textAlignment = textAlignment
    }
    
    
    //reactive programming
    
     func nextPhoto() {
        imageIndex = imageIndex + 1
    }
    
    func prevphoto() {
        imageIndex = imageIndex - 1
    }
    
}
