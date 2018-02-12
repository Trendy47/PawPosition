//
//  MapConfigurator.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 2/11/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import Foundation

protocol MapConfigurator {
    func configure(mapViewController: MapViewController)
}

class MapConfiguratorImplementation: MapConfigurator {
    var mapPresenterDelegate: MapPresenterDelegate?
    
    init(mapPresenterDelegate: MapPresenterDelegate?) {
        self.mapPresenterDelegate = mapPresenterDelegate
    }
    
    func configure(mapViewController: MapViewController) {
        let presenter = MapPresenterImplementation(delegate: mapPresenterDelegate)
        mapViewController.presenter = presenter
    }
}
