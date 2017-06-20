//
//  ItemDetailsVCNew.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/8/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import GooglePlaces

class ItemDetailsVCNew: UIViewController {
    
    @IBOutlet weak var placeThumb: UIImageView?
    @IBOutlet weak var newNameField: UITextField!
    @IBOutlet weak var newLocationField: UITextField!
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    var lat: Double?
    var long: Double?
    
    
    @IBAction func saveLocationTapped(_ sender: UIButton) {
        
        let item = Item(context: context)
        let image = Image(context: context)
        
        if let name = newNameField.text {
            
            item.name = name
        }
        
        if let location = newLocationField.text {
            
            item.location = location
        }
        
        if let picture = placeThumb?.image {
            
            
            image.image = picture
            
        }
        
        if lat != nil {
            
            item.lat = lat!
            
        }
        
        if long != nil {
            
            item.long = long!
            
        }
        
        ad.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self as GMSAutocompleteResultsViewControllerDelegate
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRect(x: 0, y: 65.0, width: 375.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
        
        // Do any additional setup after loading the view.
    }
}

// Handle the user's selection.
extension ItemDetailsVCNew: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        
        var city = String()
        var state = String()
        var country = String()
        
        
        for component in place.addressComponents! {
            
            if component.type == "locality" {
                
                newNameField.text = place.name
                city = component.name
                
            }
            
            if component.type == "administrative_area_level_1" {
                
                newNameField.text = place.name
                state = component.name
            }
            
            if component.type == "country" {
                
                newNameField.text = place.name
                country = component.name
            }
            
        }
        
        lat = place.coordinate.latitude
        long = place.coordinate.longitude
        
        
        var outputArray = [String]()
        
        if !city.isEmpty {
            
            outputArray.append(city)
        }
        
        if !state.isEmpty {
            
            outputArray.append(state)
        }
        
        if !country.isEmpty {
            
            outputArray.append(country)
        }
        
        let outputString: String = outputArray.joined(separator: ", ")
        
        newLocationField.text = outputString
        
        ad.saveContext()
        
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


