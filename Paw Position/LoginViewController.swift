//
//  LoginViewController.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 5/22/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController : ViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().signInSilently()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        handle = Auth.auth().addStateDidChangeListener( { (auth, user) in
            if user != nil {
                //self.performSegue(withIdentifier: viewController name sender: nil)
            }
        })
        
        applyStyle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    // MARK: IBActions
    @IBAction func didTapLogin(_ sender: Any) {
        
    }
    
    @IBAction func didTapCreateAccount(_ sender: Any) {
        
    }
    
    @IBAction func didTapGoogleSignIn(_ sender: Any) {
        
    }
    
    // MARK: Private
    func applyStyle() {
        self.loginButton.layer.cornerRadius = 4.0
        self.createAccountButton.layer.cornerRadius = 4.0
        self.createAccountButton.layer.borderColor = UIColor.darkGray.cgColor
        self.createAccountButton.layer.borderWidth = 1.0
    }
    
}
