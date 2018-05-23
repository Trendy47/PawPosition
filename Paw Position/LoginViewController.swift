//
//  LoginViewController.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 5/22/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : ViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    @IBAction func didTapLogin(_ sender: Any) {
        
    }
}
