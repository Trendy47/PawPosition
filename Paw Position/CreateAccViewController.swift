//
//  CreateAccViewController.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 7/17/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import Foundation
import UIKit

class CreateAccViewController: ViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: IBActions
    @IBAction func didTapCreate(_ sender: Any) {
        
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Private
    func applyStyle() {
        
    }
}
