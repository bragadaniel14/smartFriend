//
//  ViewController.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/2/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit
import os.log

class MainPageController: UIViewController {

    // Properties
    var player: Character?
    
    //MARK: IB variables
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var yourProfileButton: UIButton!
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var storyTimeButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadButtons()
        if let savedCharacter = loadCharacter() {
            player = savedCharacter
        }
    }

    private func saveCharacter() {
        let isSucessfulSave = NSKeyedArchiver.archiveRootObject(player!, toFile: Character.ArchiveURL.path)
        if isSucessfulSave {
            os_log("Player successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save player...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadCharacter() -> Character? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Character.ArchiveURL.path) as? Character
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? ""){
        case "editProfile":
            guard let navigationController = segue.destination as? UINavigationController else {
                fatalError("Redirecting to wrong page \(segue.destination)")
            }
            guard let yourProfile = navigationController.topViewController as? yourProfileViewController else {
                fatalError("Redirecting to wrong page part 2 \(segue.destination)")
            }
            yourProfile.player = self.player
            
            os_log("Editing Profile", log: OSLog.default, type: .debug)
            
        case "storyTime":
            os_log("Starting story", log: OSLog.default, type: .debug)
            guard let navigationController = segue.destination as? UINavigationController else {
                fatalError("Redirecting to wrong page \(segue.destination)")
            }
            guard let storyTime = navigationController.topViewController as? storyTimeViewController else {
                fatalError("Redirecting to wrong page part 2 \(segue.destination)")
            }
            storyTime.player = self.player
            
        case "shopping":
            os_log("Going to store", log: OSLog.default, type: .debug)
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    @IBAction func unwindToMainPage(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? yourProfileViewController {
            player = sourceViewController.player
        }
        saveCharacter()
    }

    //MARK: Private Methods
    
    private func loadButtons(){
        storyTimeButton.layer.cornerRadius = storyTimeButton.frame.height / 2
        
        storyTimeButton.backgroundColor = UIColor.blue
        storyTimeButton.clipsToBounds = true
        storyTimeButton.tintColor = UIColor.white
        
        
        yourProfileButton.layer.cornerRadius = storyTimeButton.frame.height / 2
        
        yourProfileButton.backgroundColor = UIColor.blue
        yourProfileButton.clipsToBounds = true
        yourProfileButton.tintColor = UIColor.white
        
        storeButton.layer.cornerRadius = storyTimeButton.frame.height / 2
        
        storeButton.backgroundColor = UIColor.blue
        storeButton.clipsToBounds = true
        storeButton.tintColor = UIColor.white
        
    }
    

}

