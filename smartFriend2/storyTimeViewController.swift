//
//  storyTimeViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/10/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class storyTimeViewController: UIViewController, UITextViewDelegate{

    // Properties
    var player: Character?
    var index: Int = 0
    var decision: Int = -1
    
    
    
    //MARK: IB variables
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var john: UIImageView!
    @IBOutlet weak var investigator: UIImageView!
    
    @IBOutlet weak var final1: UITextView!
    @IBOutlet weak var final2: UITextView!
    @IBOutlet weak var text1: UITextView!
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var text3: UITextView!
    @IBOutlet weak var text4: UITextView!
    @IBOutlet weak var bip: UIImageView!
    @IBOutlet weak var text5: UITextView!
    @IBOutlet weak var text6: UITextView!
    @IBOutlet weak var text7: UITextView!
    @IBOutlet weak var text8: UITextView!
    @IBOutlet weak var text9: UITextView!
    
    @IBOutlet weak var buttons: UIStackView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    //MARK: IB functions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func button1(_ sender: UIButton) {
        decision = 1
        disableButtons()
        text8.text = "In the beginning it was very rare. Now it is almost every day."
        resize(textView: text8)
        onTop(of: john, with: text8)
        text9.text = "But it is fine. I guess I am already used to it."
        resize(textView: text9)
        onTop(of: john, with: text9)
        final1.text = "That was a great attitude! You have shown to your friend that you care about him and that you are there for him"
        final2.text = "You earned the Investigator outfit!"
        onTop(of: investigator, with: final2)
        
        branching()
        
    }
    @IBAction func button2(_ sender: UIButton) {
        decision = 2
        text8.text = "I guess you are right! I will try not to think about it."
        resize(textView: text8)
        onTop(of: john, with: text8)
        final1.text = "Good job trying to cheer John up! However, you should try to ask more questions first to understand how your friend is feeling.  Maybe he already tried to forget about the messages but he can’t."
        disableButtons()
        branching()
    }
    @IBAction func button3(_ sender: UIButton) {
        decision = 3
        text8.text = "Oh! You want to play games now? That’s probably a good idea..."
        resize(textView: text8)
        onTop(of: john, with: text8)
        final1.text = "You clearly care about your friend, but this solution is temporary. Your friend will receive more mean messages later and you won’t be there to help him forget about it."
        disableButtons()
        branching()
    }
    
    
    
    @IBAction func moveStory(_ sender: UITapGestureRecognizer) {
        index += 1
        print(index)
        switch(index){
        
        case 1:
            view.bringSubview(toFront: text2)
            view.sendSubview(toBack: text1)
        case 2:
            
            view.bringSubview(toFront: bip)
            view.sendSubview(toBack: text2)
        case 3:
            resize(textView: text3)
            onTop(of: john, with: text3)
            view.bringSubview(toFront: text3)
            view.sendSubview(toBack: bip)
        case 4:
            resize(textView: text4)
            onTop(of: imageView, with: text4)
            view.bringSubview(toFront: text4)
            view.sendSubview(toBack: text3)
        case 5:
            resize(textView: text5)
            onTop(of: john, with: text5)
            view.bringSubview(toFront: text5)
            view.sendSubview(toBack: text4)
        case 6:
            resize(textView: text6)
            onTop(of: john, with: text6)
            view.bringSubview(toFront: text6)
            view.sendSubview(toBack: text5)
        case 7:
            view.bringSubview(toFront: text7)
            view.sendSubview(toBack: text6)
            view.bringSubview(toFront: buttons)
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            
        default:
            print("Not doing much here")
            branching()
            
        }
    }
    
    
    
    //MARK: Private functions
    
    
    
    private func branching(){
        if(decision == 1){
            if (index == 7){
                view.bringSubview(toFront: text8)
            } else if(index == 8){
                view.bringSubview(toFront: text9)
                view.sendSubview(toBack: text8)
            } else if(index == 9){
                view.bringSubview(toFront: final1)
                view.sendSubview(toBack: text9)
            } else if (index == 10){
                view.bringSubview(toFront: final2)
                view.bringSubview(toFront: investigator)
                view.sendSubview(toBack: final1)
            } else {
                performSegue(withIdentifier: "toScene2", sender: self)
            }
    
        } else if(decision == 2){
            if (index == 7){
                view.bringSubview(toFront: text8)
            } else if (index == 8){
                view.bringSubview(toFront: final1)
                view.sendSubview(toBack: text8)
            } else {
                performSegue(withIdentifier: "toScene2", sender: self)
            }
        } else if(decision == 3){
            if (index == 7){
                view.bringSubview(toFront: text8)
            } else if (index == 8){
                view.bringSubview(toFront: final1)
                view.sendSubview(toBack: text8)
            } else {
                performSegue(withIdentifier: "toScene2", sender: self
                )
            }
        }
    }
    
    private func disableButtons(){
        view.sendSubview(toBack: text7)
        view.sendSubview(toBack: buttons)
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
    }
    
    private func resize(textView: UITextView){
        let newSize = textView.sizeThatFits(CGSize(width: 200, height: 60))
        textView.frame.size = newSize
    }
    
    private func onTop(of image: UIImageView, with text: UITextView){
        text.frame.origin.y = image.frame.origin.y - 8 - text.frame.height
        text.frame.origin.x = image.frame.origin.x + image.frame.width/2 - text.frame.width/2
        
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustImage(with: player?.gender)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let scene2 = segue.destination as? scene2ViewController else {
            fatalError("Segue doesn't work")
        }
        scene2.player = self.player
        scene2.decision = self.decision
        
    }
    
    

}