//
//  CardView.swift
//  StackViewApp
//
//  Created by Oniel Rosario on 10/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var cardViewModel: CardViewModel! {
        didSet {
            let name = cardViewModel.imageNames.first ?? ""
            imageView.image = UIImage(named:name)
            infoLabel.textAlignment = cardViewModel.textAlignment
            infoLabel.attributedText = cardViewModel.attributes
            cardViewModel.imageNames.forEach { (_) in
                let barView = UIView()
                barView.layer.cornerRadius = 1
                barView.backgroundColor = barDeselectedColor
                barStackView.addArrangedSubview(barView)
            }
            barStackView.arrangedSubviews.first?.backgroundColor = .white
        }
    }
    fileprivate  let imageView = UIImageView(image: #imageLiteral(resourceName: "hipsterGirl"))
    fileprivate let infoLabel = UILabel()
    fileprivate  var rotateUpDown = 0
    fileprivate let threshold: CGFloat = 80
    fileprivate  let gradient = CAGradientLayer()
    fileprivate let barStackView = UIStackView()
    fileprivate var imageIndex = 0
    fileprivate let barDeselectedColor = UIColor(white: 0, alpha: 0.1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardLayout()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    
    fileprivate func setupCardLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        
        
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        
        setupBarStackView()
        setupGradient()
        addSubview(infoLabel)
        infoLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        infoLabel.textColor = .white
        infoLabel.numberOfLines = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: imageView)
            if position.y > 374.5 {
                rotateUpDown = -1
            } else {
                rotateUpDown = 1
            }
        }
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handlerChanded(gesture)
        case .ended:
            handleEnded(gesture)
            self.superview?.subviews.last?.layer.removeAllAnimations()
        default:
            ()
        }
    }
    
    fileprivate func handlerChanded(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        //convert radians to degrees
        let degrees: CGFloat = translation.x / 20
        let angle = (degrees * .pi / 180) * CGFloat(rotateUpDown)
        let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                self.frame = CGRect(x: 800 * translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
            } else {
                self.transform = .identity
            }
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupGradient() {
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.5,1.1]
        layer.addSublayer(gradient)
    }
    
    fileprivate func setupBarStackView() {
        addSubview(barStackView)
        barStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 3))
        barStackView.spacing = 4
        barStackView.distribution = .fillEqually
    }
    
    @objc fileprivate func handleTap(gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: nil)
        let nextPhoto = tapLocation.x > frame.width / 2 ? true : false
        if nextPhoto {
            cardViewModel.nextPhoto()
        } else {
            cardViewModel.prevphoto()
        }
        barStackView.arrangedSubviews.forEach { (v) in
            v.backgroundColor = barDeselectedColor
        }
        imageView.image = UIImage(named: cardViewModel.imageNames[imageIndex])
        barStackView.arrangedSubviews[imageIndex].backgroundColor = .white
    }
    
    override func layoutSubviews() {
        gradient.frame = self.frame
    }
    
}
