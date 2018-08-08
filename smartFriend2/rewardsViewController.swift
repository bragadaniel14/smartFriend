//
//  rewardsViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/31/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class rewardsViewController: UIViewController {

    //MARK: Properties
    var player: Character?
    var decision: Int = -1
    var index = 0
    var secDecision = -1
    
    //MARK: IB Variables
    
    @IBOutlet weak var cyberMedal: UIImageView!
    @IBOutlet weak var investigatorMedal: UIImageView!
    
    @IBOutlet weak var cyberResult: UITextView!
    @IBOutlet weak var investigatorResult: UITextView!
    
    @IBOutlet weak var endButton: UIButton!
    
    // MARK: Private Functions
    @objc private func finish(button: UIButton){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func setResults(){
        if(decision == 1){
            investigatorResult.text = "You asked how John was feeling when you saw that he received that mean message. This shows to John that you care about him and he will know that he is not facing this bad situation alone."
            investigatorMedal.image = UIImage(named: "gold")
        } else {
            investigatorResult.text = "When you see that friends being cyberbullyed, it is important to ask how they are feeling. This will show that you care about them and they will feel that they don't have to face this bad situation alone."
            investigatorMedal.image = UIImage(named: "silver")
        }
        
        if(secDecision == 1) {
            cyberResult.text = "What happened with John is an example of cyberbullying. Cyberbullying happens when people use the internet to be mean to others. You should always tell a responsible adult when you see it happening with a friend or with you. Good job talking about it with your parents in the story!"
            cyberMedal.image = UIImage(named: "gold")
        } else {
            cyberResult.text = "What happened with John is an example of cyberbullying. Cyberbullying happens when people use the internet to be mean to others. You should always tell a responsible adult when you see it happening with a friend or with you. Next time you see cyberbullying,  report it to an adult as soon as you can!"
            cyberMedal.image = UIImage(named: "silver")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setResults()
        endButton.addTarget(self, action: #selector(finish(button:)), for: UIControlEvents.touchUpInside)
        endButton.contentEdgeInsets = UIEdgeInsetsMake(5,10,5,10)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Eat the burrito.
    }
    */

}
