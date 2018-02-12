//
//  MapPresenter.swift
//  Paw Position
//
//  Created by Christopher Tirendi on 2/11/18.
//  Copyright © 2018 Chris Tirendi. All rights reserved.
//

import Foundation

protocol MapView: class {
    
}

protocol MapPresenterDelegate: class {
    func addPresenter(_ presenter: MapPresenter)
    func addPresenterCancel(presenter: MapPresenter)
}

protocol MapPresenter {
    
}

class MapPresenterImplementation: MapPresenter {
//    fileprivate weak var view: MapViewController?
    fileprivate weak var delegate: MapPresenterDelegate?
    
    init(delegate: MapPresenterDelegate?) {
        self.delegate = delegate
    }
}
