//
//  ViewController.swift
//  GoogleMapsEjemplo
//
//  Created by Julio Cesar Galeano on 10/10/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //creating a camera
        let camera = GMSCameraPosition.camera(withLatitude: 23.431351, longitude: 85.325879, zoom: 6.0)
        //this is our map view
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //adding mapview to view
        view = mapView
        //creating a marker on the map
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 23.431351, longitude: 85.325879)
        marker.title = "Ranchi, Jharkhand"
        marker.map = mapView
    }
}

