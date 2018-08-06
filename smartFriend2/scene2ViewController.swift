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
    @IBOutlet weak var nextt: UIButton!
    
    
    
    //MARK: Private Functions
    
    @objc private func moveStory(button: UIButton) {
        performSegue(withIdentifier: "toScene3", sender: self)
    }
    
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
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: false, completion:nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustImage(with: player!.gender)
        nextt.isEnabled = true
        nextt.addTarget(self, action: #selector(scene2ViewController.moveStory(button:))
            , for: UIControlEvents.touchUpInside)
        
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
