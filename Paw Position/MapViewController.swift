//
//  PawMapViewController.swift
//  Paw Position
//
//  Created by Chris Tirendi on 8/22/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: ViewController, MKMapViewDelegate {
    
    // outlets
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    let ppLocationManager: PawLocationManager = PawLocationManager.sharedInstance
    
    var annotations: Array<MKAnnotation> = Array<MKAnnotation>()
    
    var selectedLocation: CLLocationCoordinate2D?
    var selectedMarker: MapMarker?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.delegate = self
        
        ppLocationManager.startUpdatingLocation()
        if let test = ppLocationManager.lastLocation {
            centerOnMapLocation(location: test)
        }
        
        mapView.register(MapMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // create gesture
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.onMapLongPress(_:)))
        longPress.minimumPressDuration = 1.5 // in seconds
        
        // add gesture
        mapView.addGestureRecognizer(longPress)
        
        // show map object on map - this is for testing
        let message = "Lost dog near some street, likes cheese, is brown with black spots."
        let annotation = MapMarker(title: "Lost Dog", name: "Sparky", discipline: "Dog", message: message, coordinate: CLLocationCoordinate2D(latitude: 41.3782, longitude: -73.7128))
        
        annotations.append(annotation)
        mapView.addAnnotations(annotations)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: map touch events
    @objc func onMapLongPress(_ recognizer: UIGestureRecognizer) {
        // set map location
        let touch = recognizer.location(in: self.mapView)
        selectedLocation = mapView.convert(touch, toCoordinateFrom: self.mapView)
        
        performSegue(withIdentifier: "markDetail", sender: self)
    }
    
    // MARK: Location
    func centerOnMapLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius,regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            selectedMarker = view.annotation as? MapMarker
            performSegue(withIdentifier: "markDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "markDetail" {
            if let controller = segue.destination as? MapDetailViewController {
                controller.mMapMarker = selectedMarker
                controller.mLocation = selectedLocation
                
                // callback for adding marker to map
                controller.addMarkerToMap = { result in self.annotations.append(result)
                    self.mapView.addAnnotations(self.annotations)
                }
            }
        }
    }
}
