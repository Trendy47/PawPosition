//
//  PawMarker.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 12/4/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import MapKit

class MapMarker: NSObject, MKAnnotation {
    let title: String?
    let name: String
    let discipline: String
    let message: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, name: String, discipline: String, message: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.name = name
        self.discipline = discipline
        self.message = message
        self.coordinate = coordinate
    }
    
    var subtitle: String? {
        return name
    }
    
    var getMessage: String? {
        return message
    }
    
    var markerTintColor: UIColor {
        switch discipline {
        case "Dog":
            return .red
        case "Cat":
            return .blue
        default:
            return .green
        }
    }
}
