//
//  PawDetailViewController.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 12/9/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PawDetailViewController: ViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pawImageView: UIImageView!
    
    var pawMarkerObject: PawMarker?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if pawMarkerObject == nil {
            return
        }
        
        let title: String = (pawMarkerObject?.title)!
        let name: String = (pawMarkerObject?.subtitle)!
        let message: String = (pawMarkerObject?.getMessage)!
        
        titleLabel.text = title
        nameLabel.text = name
        messageTextView.text = message
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func didTapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
