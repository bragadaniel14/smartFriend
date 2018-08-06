//
//  scene4GoodViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/24/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class scene4GoodViewController: UIViewController {

    //MARK: Properties
    var player: Character?
    var decision: Int = -1
    var index = 0
    var secDecision = -1
    
    //MARK: IB Variables
    @IBOutlet weak var text1: UITextView!
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var text3: UITextView!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var nextt: UIButton!
    
    @objc private func moveStory(button: UIButton) {
        index += 1
        print("Can't touch this")
        if(index == 1){
            view.sendSubview(toBack: text1)
            view.bringSubview(toFront: text2)
        }
        if(index == 2){
            view.sendSubview(toBack: text2)
            view.bringSubview(toFront: text3)
            background.image = UIImage(named: "storyBackground2")
            
        }
        if(index == 3){
            print("what now")
            
            performSegue(withIdentifier: "toRewards", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextt.addTarget(self, action: #selector(scene4GoodViewController.moveStory(button:)), for: UIControlEvents.touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let scene = segue.destination as? rewardsViewController else {
            fatalError("deu ruim mermao")
        }
        scene.player = player
        scene.decision = decision
        scene.secDecision = secDecision
        
    }
    

}
