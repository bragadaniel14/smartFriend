//
//  yourProfileViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/2/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit
import os.log

class yourProfileViewController: UIViewController, genderTypeDelegate, UITextFieldDelegate {
    
    //MARK: GenderType Delegate Function
    func performButtonAction(with index: Int) {
        switch index{
        case 0:
            character.image = UIImage(named: "girl")
        case 1:
            character.image = UIImage(named: "boy")
        default:
            fatalError("what have I passed? '\(index)'")
            
        }
    }
    
    // Properties
    var player: Character?
    
    //MARK: IB variables
    @IBOutlet weak var character: UIImageView!
    @IBOutlet weak var genderType: genderType!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    //MARK: IB Actions
    @IBAction func editName(_ sender: UIButton) {
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Private Functions
    private func sizePictureToScreen(){
        
        let screenSize: CGRect = UIScreen.main.bounds
        imageCharacter.frame = CGRect(x: 0, y: 0, width: screenSize.width * 0.3, height: screenSize.height * 0.3)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        genderType.delegate = self
        
        nameTextField.delegate = self
        nameTextField.isHidden = true
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        if (player != nil) {
            nameLabel.text = player!.name
            genderType.gender = player!.gender
            switch genderType.gender{
            case 0:
                character.image = UIImage(named: "girl")
            case 1:
                character.image = UIImage(named: "boy")
            default:
                fatalError("Something with wrong with the gender")
            }
        } else {
            nameLabel.text = "Default Name"
            genderType.gender = 0
        }
        
        
    }
    
    
    //MARK: TextField delegate functions
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        nameLabel.text = textField.text
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    /*
     For near future use
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.text = textField.text
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === doneButton else {
            os_log("The done button was not pressed, canceling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameLabel.text
        let achievements = 0
        let gender =  genderType.gender
        player = Character(name: name!, achievements: achievements, gender: gender)
        
    }
    

}
