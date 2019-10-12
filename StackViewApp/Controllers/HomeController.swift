//
//  ViewController.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    let cardViewModels: [CardViewModel] = {
        let producers = [
            User(name: "Sam", age: 23, profession: "Designer", imageNames: ["hipsterGirl"]),
            User(name: "Gina", age: 22, profession: "Model", imageNames: ["latina"]),
            Advertisement(title: "Slide Out Menu", brandName: "Let's Build an App", posterPhotoName: "Ad"),
            User(name: "Yuki", age: 25, profession: "Blogger", imageNames: ["asian1","asian2","asian3"]),
            User(name: "Monica", age: 26, profession: "Entreprenour", imageNames: ["blackGirl"]),
            User(name: "Lisa", age: 23, profession: "MUA", imageNames: ["asianGirl"])
        ] as [CardViewModeling]
        let viewModels = producers.map({return $0.toCardViewModel()})
        return viewModels
    }()
    
    let topStackView = HomeButtonTopControlStackView()
    let cardDeckView = UIView()
    let buttonStackView = HomeBottomControlStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards() {
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardVM
            cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    
    
    // MARK:- Fileprivate
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView,cardDeckView,buttonStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
        overallStackView.bringSubviewToFront(cardDeckView)
    }
}

