//
//  PawButton.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 7/17/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import Foundation
import UIKit

class PawButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 4.0
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.white, for: .highlighted)
    }
    
    override var isHighlighted: Bool {
        didSet {
            
            if (isHighlighted) {
                self.backgroundColor = UIColor.init(netHex: PawColor.accentColorDark())
            } else {
                self.backgroundColor = UIColor.init(netHex: PawColor.accentColor())
            }
            
        }
    }
}
