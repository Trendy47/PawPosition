//
//  PawMarkerView.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 12/5/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import MapKit

class PawMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let pawMarker = newValue as? PawMarker else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: 0, y: 0)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = pawMarker.markerTintColor
            glyphText = "\(pawMarker.discipline.first ?? "P")"
        }
    }
}
