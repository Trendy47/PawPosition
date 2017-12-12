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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pawImageView: UIImageView!
    
    var isAddingMarker: Bool?
    var location: CLLocationCoordinate2D?
    
    var pawMarkerObject: PawMarker?
    
    // callback function
    var addMarkerToMap: ((_ result: PawMarker) -> ())?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if pawMarkerObject != nil {
            let title: String = (pawMarkerObject?.title)!
            let name: String = (pawMarkerObject?.subtitle)!
            let message: String = (pawMarkerObject?.getMessage)!
            
            titleTextField.text = title
            nameTextField.text = name
            messageTextView.text = message
        }
        
        if !isAddingMarker! {
            addButton.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: IBActions
    @IBAction func didTapAdd(_ sender: UIButton) {
        let title: String = (titleTextField.text)!
        let name: String = (nameTextField.text)!
        let message: String = (messageTextView.text)!
        
        let marker = PawMarker.init(title: title, pawName: name, discipline: "Dog", message: message, coordinate: location!)
        
        // callback to add marker to map
        addMarkerToMap?(marker)
        
        // close detail view
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
