//
//  PawAnnotation.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 12/4/17.
//  Copyright © 2017 Chris Tirendi. All rights reserved.
//

import MapKit

class PawAnnotation: NSObject, MKAnnotation {
    let title: String?
    let name: String?
    let subText: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, name: String, subText: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.name = name
        self.subText = subText
        self.coordinate = coordinate
        
        super.init()
    }
}
