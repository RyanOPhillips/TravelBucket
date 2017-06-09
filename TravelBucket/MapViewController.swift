//
//  MapViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/6/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var center = CLLocationCoordinate2D()
    let manager = CLLocationManager()
    var camera = GMSCameraPosition()
    var mapView = GMSMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

        
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.isMyLocationEnabled = true
        
        mapView.animate(to: camera)
        
        
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let userLocation = locations.last
        center = CLLocationCoordinate2D(latitude: (userLocation?.coordinate.latitude)!, longitude: (userLocation?.coordinate.longitude)!)
        
        camera = GMSCameraPosition.camera(withLatitude: center.latitude, longitude: center.longitude, zoom: 1.0)
        
        mapView.animate(to: camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        manager.stopUpdatingLocation()
    }
    

}
