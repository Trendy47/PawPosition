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

class MapDetailViewController: ViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pawImageView: UIImageView!
    
    var mLocation: CLLocationCoordinate2D?
    var mMapMarker: MapMarker?
    
    // callback function
    var addMarkerToMap: ((_ result: MapMarker) -> ())?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mMapMarker != nil {
            let title: String = (mMapMarker?.title)!
            let name: String = (mMapMarker?.subtitle)!
            let message: String = (mMapMarker?.getMessage)!
            
            titleTextField.text = title
            nameTextField.text = name
            messageTextView.text = message
            
            addButton.isHidden = true
        } else {
            // if object is null, then add create new object to add to map
            addButton.isHidden = false
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // clear object when view is removed from foreground
        mMapMarker = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: IBActions
    @IBAction func didTapAdd(_ sender: UIButton) {
        let title: String = (titleTextField.text)!
        let name: String = (nameTextField.text)!
        let message: String = (messageTextView.text)!
        
        let marker = MapMarker(title: title, name: name, discipline: "Dog", message: message, coordinate: mLocation!)
        
        // callback to add marker to map
        addMarkerToMap?(marker)
        
        // close detail view
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
