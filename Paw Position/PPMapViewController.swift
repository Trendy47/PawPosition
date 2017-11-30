//
//  PPMapViewController.swift
//  Paw Position
//
//  Created by Chris Tirendi on 8/22/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import UIKit
import MapKit

class PPMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    /**
     * Life Cycle
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let initialLoc = CLLocation(latitude: 41.7359, longitude: -73.01538)
        centerOnMapLocation(location: initialLoc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * End Region
     */
    
    /**
     * Location
     */
    func centerOnMapLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius,regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    /**
     * End Region
     */
}
