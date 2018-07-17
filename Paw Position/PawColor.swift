//
//  PawColor.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 7/16/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import Foundation
import UIKit

class PawColor {
    
    static func primaryColor() -> Int {
        return 0x607D8B
    }
    
    static func primaryColorDark() -> Int {
        return 0x455A64
    }
    
    static func primaryColorLight() -> Int {
        return 0xCFD8DC
    }
    
    static func accentColor() -> Int {
        return 0x7C4DFF
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
