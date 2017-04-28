//  StarControl.swift - Trick Tracker

//  Created by Harvey Wang
//  Copyright © 2017 Harvey Wang. All rights reserved.

/*
 
 References:
 
 Title: Start Developing iOS Apps (Swift)
 Author: Apple Inc.
 Date: 2016-12-08
 Type: Source code
 Availability: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1
 
*/


import UIKit

@IBDesignable class StarControl: UIStackView {
    
    //MARK: Properties
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setButtons()
        }
    }
    
    private var starButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }

    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setButtons()
    }
    
    //MARK: Button Action
    
    func buttonTapped(button: UIButton) {
        guard let index = starButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the starButtons array: \(starButtons)")
        }
        
        let selectedStar = index + 1
        
        if selectedStar == rating {
            // if selected star represents the cureent rating, reset the rating to 0
            rating = 0
        } else {
            // else set raing to selected star
            rating = selectedStar
        }
    }
    
    
    //MARK: Private Methods
    
    private func setButtons() {
        
        // clear existing buttons
        for button in starButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        starButtons.removeAll()
        
        // load images for buttons
        let bundle = Bundle(for: type(of: self))
        let blackStar = UIImage(named: "blackStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let blueStar = UIImage(named: "blueStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            
            let button = UIButton() // create button
            
            // set button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(blackStar, for: .selected)
            button.setImage(blueStar, for: .highlighted)
            button.setImage(blueStar, for: [.highlighted, .selected])
            
            // button's contraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // setup button action
            button.addTarget(self, action: #selector(StarControl.buttonTapped(button:)), for: .touchUpInside)
            
            // add button to stack
            addArrangedSubview(button)
            
            // add button to starButton array
            starButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in starButtons.enumerated() {
            // select indices less than the rating
            button.isSelected = index < rating
            
            // set acccessibility hint and value
            let hint: String?
            if rating == index + 1 {
                hint = "Tap to reset the rating to zero"
            } else {
                hint = nil
            }
            
            let value: String
            switch (rating) {
            case 0:
                value = "No rating set."
            case 1:
                value = "1 star set."
            default:
                value = "\(rating) stars set."
            }
            
            button.accessibilityHint = hint
            button.accessibilityHint = hint
        }
    }
}
