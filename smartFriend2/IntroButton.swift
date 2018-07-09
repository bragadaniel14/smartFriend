//
//  IntroButton.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/2/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class IntroButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = frame.height / 2
        backgroundColor = UIColor.blue
        clipsToBounds = true
        tintColor = UIColor.white
        super.draw(rect)
        
        // Drawing code
    }
    

}
