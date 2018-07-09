//
//  Character.swift
//  smartFriend2
//
//  Created by Daniel Braga on 7/3/18.
//  Copyright © 2018 Daniel Braga. All rights reserved.
//

import UIKit
import os.log

class Character: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var achievements: Int
    var gender: Int
    
    struct PropertyKey{
        static let name = "name"
        static let achievements = "achievements"
        static let gender = "gender"
    }
    
    //MARK: Initialization
    
    init?(name: String, achievements: Int, gender: Int){
        guard !name.isEmpty else {
            return nil
        }
        
        guard (achievements >= 0) else {
            return nil
        }
        
        if name.isEmpty || achievements < 0 {return nil}
        
        self.name = name
        self.achievements = achievements
        self.gender = gender
        
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(achievements, forKey: PropertyKey.achievements)
        aCoder.encode(gender, forKey: PropertyKey.gender)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for Character object.", log: OSLog.default, type: .debug)
            return nil
        }
        let achievements = aDecoder.decodeInteger(forKey: PropertyKey.achievements)
        let gender = aDecoder.decodeInteger(forKey: PropertyKey.gender)
        
        self.init(name: name, achievements: achievements, gender: gender)
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("characters")
    
    
    
}


