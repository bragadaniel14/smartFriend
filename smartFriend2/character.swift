//
//  character.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/2/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class characterImageView: UIImageView {
    var gender = 0 {
        didSet{
            selectImage()
        }
    }
    
    private func selectImage() {
        if gender == 1 {
            image = UIImage(named: "girl")
        } else {
            image = UIImage(named: "boy")
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
