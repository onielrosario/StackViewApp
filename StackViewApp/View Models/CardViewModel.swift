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
    fileprivate var imageIndex = 0 {
        didSet {
            let imageName = imageNames[imageIndex]
            let image = UIImage(named: imageName)
            imageIndexObserver?(imageIndex,  image)
        }
    }
    init(imageNames: [String], attributes: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributes = attributes
        self.textAlignment = textAlignment
    }
    //reactive programming
    var imageIndexObserver: ((Int, UIImage?) -> ())?
    
     func nextPhoto() {
        imageIndex = min(imageIndex + 1, imageNames.count - 1)
    }
    func prevphoto() {
        imageIndex = max(0, imageIndex - 1)
    }
}
