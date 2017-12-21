//
//  PawDataManager.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 12/19/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import Foundation
import Firebase

class PawDataManager {
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    func writeData(pawDict: Dictionary<String, String>) {
        let title = pawDict.index(forKey: "title")
        let name = pawDict.index(forKey: "name")
        let discipline = pawDict.index(forKey: "discipline")
        let message = pawDict.index(forKey: "message")
        let latitude = pawDict.index(forKey: "latitude")
        let longitude = pawDict.index(forKey: "longitude")
        
        self.ref.child("paws").setValue(title, forKey: "title")
        self.ref.child("paws").setValue(name, forKey: "name")
        self.ref.child("paws").setValue(discipline, forKey: "discipline")
        self.ref.child("paws").setValue(message, forKey: "message")
        self.ref.child("paws").setValue(latitude, forKey: "latitude")
        self.ref.child("paws").setValue(longitude, forKey: "longitude")
    }
}
