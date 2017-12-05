//
//  PPMapViewController.swift
//  Paw Position
//
//  Created by Chris Tirendi on 8/22/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import UIKit
import MapKit

class PawMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    let ppLocationManager: PawLocationManager = PawLocationManager.sharedInstance
    
    /**
     * Life Cycle
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ppLocationManager.startUpdatingLocation()
        if let test = ppLocationManager.lastLocation {
            centerOnMapLocation(location: test)
        }
        
        // show map object on map - this is for testing
        let mapObject = PawAnnotation(title: "Lost Dog", name: "Sparky", subText: "Lost dog near some street, likes cheese", coordinate: CLLocationCoordinate2D(latitude: 41.3782, longitude: -73.7128))
        
        mapView.addAnnotation(mapObject)
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
