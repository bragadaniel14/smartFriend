//
//  scene3ViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/19/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit

class scene3ViewController: UIViewController {

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
    @IBOutlet weak var text8: UITextView!
    @IBOutlet weak var text9: UITextView!
    @IBOutlet weak var text10: UITextView!
    @IBOutlet weak var text11: UITextView!
    
    @IBOutlet weak var buttons: UIStackView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var nextt: UIButton!
    
    //MARK: IB Actions
    
    @IBOutlet weak var buttons1: UIButton!
    @IBAction func action2(_ sender: UIButton) {
        secDecision = 2
        disableButtons()
        text5.text = "Eh…It was fun dad! I finished my work early and had some time to play with my classmates"
        let bubbleView = SpeechBubble(baseView: imageView, text: text5.text, fontSize: 20.0)
        self.view.addSubview(bubbleView)
        lastUsed = bubbleView
        /*resize(textView: text5)
        onTop(of: imageView, with: text5)*/
        text6.text = "Great son! Now take a shower and go to bed because you have school tomorrow."
        /*resize(textView: text6)
        adjust(text: text6, on: background)*/
        
        //view.bringSubview(toFront: text5)
        
    }
    @IBAction func action1(_ sender: UIButton) {
        secDecision = 1
        disableButtons()
        text5.text = "It was ok dad. But I am afraid something is wrong with John."
        let bubbleView = SpeechBubble(baseView: imageView, text: text5.text, fontSize: 20.0)
        self.view.addSubview(bubbleView)
        lastUsed = bubbleView
        //resize(textView: text5)
        //onTop(of: imageView, with: text5)
        
        text6.text = "He seemed really sad at school today and I think it is because of some offensive messages he’s been getting on the internet."
        resize(textView: text6)
        onTop(of: imageView, with: text6)
        
        resize(textView: text7)
        adjust(text: text7, on: background)
        
        
        if(decision == 1) {
            text8.text = "He told me that he gets them almost every day, but he can’t figure out who is sending the messages"
        } else {
            text8.text = "Well, I don’t know dad."
        }
        resize(textView: text8)
        onTop(of: imageView, with: text8)
        
        resize(textView: text9)
        onTop(of: imageView, with: text9)
        
        resize(textView: text10)
        adjust(text: text10, on: background)
        
        resize(textView: text11)
        adjust(text: text11, on: background)
        
        
        //view.bringSubview(toFront: text5)
        
        
        
    }
    
    
    @IBAction func moveStory(button: UIButton) {
        index += 1
        print(index)
        
        switch(index){
            
        case 1:
            let bubbleView = SpeechBubble(baseView: imageView, text: text2.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*resize(textView: text2)
            onTop(of: imageView, with: text2)
            view.bringSubview(toFront: text2)*/
            view.sendSubview(toBack: text1)
        
        case 2:
            text3.text = "Hello " + player!.name + "! How was your day?"
            view.sendSubview(toBack: lastUsed!)
            let bubbleView = SpeechBubble(baseView: centro, text: text3.text, fontSize: 20.0)
            self.view.addSubview(bubbleView)
            lastUsed = bubbleView
            /*resize(textView: text3)
            adjust(text: text3, on: background)
            view.bringSubview(toFront: text3)
            view.sendSubview(toBack: text2)*/
            
        case 3:
            view.sendSubview(toBack: lastUsed!)
            //view.sendSubview(toBack: text3)
            view.bringSubview(toFront: buttons)
            view.bringSubview(toFront: text4)
            button1.isEnabled = true
            button2.isEnabled = true
            nextt.isEnabled = false
            
        default:
            print("Not doing much here")
            branching()
            
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
    
    private func disableButtons(){
        view.sendSubview(toBack: text4)
        view.sendSubview(toBack: buttons)
        button1.isEnabled = false
        button2.isEnabled = false
        nextt.isEnabled = true
    }
    
    private func branching(){
        if(secDecision == 1){
            if(index == 4){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: imageView, text: text6.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text5)
                //view.bringSubview(toFront: text6)
            }
            else if(index == 5){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: centro, text: text7.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text6)
                //view.bringSubview(toFront: text7)
            }
            else if(index == 6){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: imageView, text: text8.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text7)
                //view.bringSubview(toFront: text8)
            }
            else if(index == 7){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: imageView, text: text9.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text8)
                //view.bringSubview(toFront: text9)
            }
            else if(index == 8){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: centro, text: text10.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text9)
                //view.bringSubview(toFront: text10)
            }
            else if(index == 9){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: imageView, text: text11.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text10)
                //view.bringSubview(toFront: text11)
            } else {
                performSegue(withIdentifier: "toGoodEnding", sender: self)

            }
        } else {
            if(index == 4){
                self.view.sendSubview(toBack: lastUsed!)
                let bubbleView = SpeechBubble(baseView: centro, text: text6.text, fontSize: 20.0)
                self.view.addSubview(bubbleView)
                lastUsed = bubbleView
                //view.sendSubview(toBack: text5)
                //view.bringSubview(toFront: text6)
            } else {
                performSegue(withIdentifier: "toBadEnding", sender: self)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustImage(with: player!.gender)
        resize(textView: text2)
        onTop(of: imageView, with: text2)
        nextt.isEnabled = true
        nextt.addTarget(self, action: #selector(scene3ViewController.moveStory(button:))
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "toGoodEnding") {
            guard let scene = segue.destination as? scene4GoodViewController else{
                fatalError("Deu ruim")
            }
            scene.player = player
            scene.decision = decision
            scene.secDecision = secDecision
            }
        else {
            guard let scene = segue.destination as? scene4BadViewController else{
                fatalError("Deu ruim")
            }
            scene.player = player
            scene.decision = decision
            scene.secDecision = secDecision
        }
        
    }
    

}
