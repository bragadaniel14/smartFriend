//
//  achievementsStack.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/3/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

@IBDesignable class achievementsStack: UIStackView {
    
    
    //MARK: Properties
    var delegate: genderTypeDelegate?
    
    private var genderButtons = [UIButton]()
    
    var gender = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 100.0, height: 100.0) {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    @objc func genderButtonTapped(button: UIButton) {
        guard let index = genderButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the gender Buttons array: \(genderButtons)")
        }
        
        delegate?.performButtonAction(with: index)
        
        // Calculate the rating of the selected button
        gender = index
    }
    
    
    //MARK: Private Methods
    
    private func setupButtons() {
        
        // Clear any existing buttons
        for button in genderButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        genderButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let pressedMale = UIImage(named: "pressedMale", in: bundle, compatibleWith: self.traitCollection)
        let pressedFemale = UIImage(named:"pressedFemale", in: bundle, compatibleWith: self.traitCollection)
        let unpressedMale = UIImage(named:"unpressedMale", in: bundle, compatibleWith: self.traitCollection)
        let unpressedFemale = UIImage(named:"unpressedFemale", in: bundle, compatibleWith: self.traitCollection)
        let highlightedMale = UIImage(named:"pressedMale", in: bundle, compatibleWith: self.traitCollection)
        let highlightedFemale = UIImage(named:"pressedFemale", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<2 {
            // Create the button
            let button = UIButton()
            
            // Set the button images
            if(index == 0) {
                button.setImage(unpressedFemale, for: .normal)
                button.setImage(pressedFemale, for: .selected)
                button.setImage(highlightedFemale, for: .highlighted)
                button.setImage(highlightedFemale, for: [.highlighted, .selected])
            } else {
                button.setImage(unpressedMale, for: .normal)
                button.setImage(pressedMale, for: .selected)
                button.setImage(highlightedMale, for: .highlighted)
                button.setImage(highlightedMale, for: [.highlighted, .selected])
            }
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(genderType.genderButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            genderButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in genderButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = (index == gender)
        }
        
    }
}



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
