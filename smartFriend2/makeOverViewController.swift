//
//  makeOverViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/24/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class makeOverViewController: UIViewController {

    //MARK: Properties
    var player: Character?
    var decision: Int = -1
    var index = 0
    var secDecision = -1
    var lastUsed: SpeechBubble?
    
    //MARK: IB Variables
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var centro: UIImageView!
    
    
    @IBOutlet weak var text1: UITextView!
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var text3: UITextView!
    @IBOutlet weak var text4: UITextView!
    @IBOutlet weak var text5: UITextView!
    @IBOutlet weak var text6: UITextView!
    @IBOutlet weak var text7: UITextView!
    
    @IBOutlet weak var nextt: UIButton!
    //MARK: IB Actions
    
    @objc private func moveStory(button: UIButton) {
        index += 1
        print(index)
        if(index == 1) {
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: imageView, text: text2.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*resize(textView: text2)
            onTop(of: imageView, with: text2)*/
        }
        if(index == 2) {
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: centro, text: text3.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*resize(textView: text3)
            adjust(text: text3, on: background)
            view.bringSubview(toFront: text3)*/
        }
        if(index == 3){
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: imageView, text: text4.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*view.sendSubview(toBack: text3)
            view.bringSubview(toFront: text4)
            resize(textView: text4)
            onTop(of: imageView, with: text4)*/
        }
        if(index == 4){
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: imageView, text: text5.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*view.sendSubview(toBack: text4)
            view.bringSubview(toFront: text5)
            resize(textView: text5)
            onTop(of: imageView, with: text5)*/
        }
        if(index == 5) {
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: centro, text: text6.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*view.sendSubview(toBack: text5)
            resize(textView: text6)
            adjust(text: text6, on: background)
            view.bringSubview(toFront: text6)*/
        }
        if(index == 6) {
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: centro, text: text7.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*view.sendSubview(toBack: text6)
            resize(textView: text7)
            adjust(text: text7, on: background)
            view.bringSubview(toFront: text7)*/
        }
        if (index > 6){
            performSegue(withIdentifier: "finishStory", sender: self)
        }
        
        
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
    
    private func resize(textView: UITextView){
        let newSize = textView.sizeThatFits(CGSize(width: 200, height: 60))
        textView.frame.size = newSize
    }
    
    private func onTop(of image: UIImageView, with text: UITextView){
        text.frame.origin.y = image.frame.origin.y - 8 - text.frame.height
        text.frame.origin.x = image.frame.origin.x + image.frame.width/2 - text.frame.width/2
        
    }
    
    private func adjust(text: UITextView, on image: UIImageView){
        text.frame.origin.y = image.frame.origin.y + image.frame.height/2 - text.frame.height/2
        text.frame.origin.x = image.frame.origin.x + image.frame.width/2 - text.frame.width/2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("got to makeover")
        if(decision == 1) {
            text4.text = "He told me that he gets them almost every day, but he can’t figure out who is sending the messages"
        } else {
            text4.text = "Well, I don’t know dad."
        }
        adjustImage(with: player!.gender)
        let bubbleView = SpeechBubble(baseView: centro, text: text1.text, fontSize: 20.0)
        self.view.addSubview(bubbleView)
        lastUsed = bubbleView
        /*resize(textView: text1)
        onTop(of: imageView, with: text1)*/
        nextt.addTarget(self, action: #selector(makeOverViewController.moveStory(button:)), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let scene = segue.destination as? scene4GoodViewController else {
            fatalError("deu ruim demais")
        } 
        scene.player = player
        scene.decision = decision
        scene.secDecision = secDecision
        
    }
 

}
