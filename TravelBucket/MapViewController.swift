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
import CoreData


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var center = CLLocationCoordinate2D()
    let manager = CLLocationManager()
    var camera = GMSCameraPosition()
    var mapView = GMSMapView()
    var storedLocations = [CLLocationCoordinate2D]()
    var userLocation = CLLocation()
    
    
    
    
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
        
        
        //        Setting markers on map for items on bucket list
        
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        
        do {
            
            let records = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
            
            for record: Item in records as! [Item] {
                
                let position = CLLocationCoordinate2D(latitude: record.lat, longitude: record.long)
                let marker = GMSMarker(position: position)
                marker.title = record.name
                marker.map = mapView
                
                storedLocations.append(position)
   
                
                if record.toImage !== nil {
                    
                    marker.icon = GMSMarker.markerImage(with: .green)
                    
                }
            }
            
            
            
            //            Setting distance between user's location and markers
            
            for newLocation in storedLocations {
                
                let newerLocation = CLLocation(latitude: newLocation.latitude, longitude: newLocation.longitude)
                
                let distance : CLLocationDistance = userLocation.distance(from: newerLocation)
                
                if(distance <= 16090) {
                    
                    
                }
                
            }
            
            print(storedLocations)
            
        } catch {
            
            print("Unable to fetch managed objects for entity")
        }
        
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        userLocation = locations.last!
        center = CLLocationCoordinate2D(latitude: (userLocation.coordinate.latitude), longitude: (userLocation.coordinate.longitude))
        
        camera = GMSCameraPosition.camera(withLatitude: center.latitude, longitude: center.longitude, zoom: 1.0)
        
        mapView.animate(to: camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        manager.stopUpdatingLocation()
    }
    
    
}
