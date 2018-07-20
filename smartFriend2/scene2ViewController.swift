//
//  scene2ViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/19/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class scene2ViewController: UIViewController {

    //MARK: Properties
    var player: Character?
    var decision: Int = -1
    
    //MARK: IB variables
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: IB Actions
    @IBAction func moveStory(_ sender: UITapGestureRecognizer) {
        print("Got here")
        performSegue(withIdentifier: "toScene3", sender: self)
    }
    
    
    //MARK: Private Functions
    private func adjustImage(with index: Int?) {
        switch index{
        case 0:
            imageView.image = UIImage(named: "girl")
        case 1:
            imageView.image = UIImage(named: "boy")
        default:
            fatalError("what have I passed? '\(index ?? 3)'")
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustImage(with: player!.gender)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for:segue, sender: sender)
        
        guard let scene3 = segue.destination as? scene3ViewController else {
            fatalError("Communication Error")
        }
        scene3.player = self.player
        scene3.decision = self.decision
    }

}
