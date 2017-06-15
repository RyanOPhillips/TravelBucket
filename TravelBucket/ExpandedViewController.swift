//
//  ExpandedViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/12/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class ExpandedViewController: UIViewController {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var datePicker: UILabel!
    
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(ExpandedViewController.imageTapped(_:)))
        
        thumbImage.addGestureRecognizer(pictureTap)
        
        thumbImage.isUserInteractionEnabled = true
        
        if itemToEdit != nil {
            loadItemData()
            
            var dateFromString = ""
            
            if itemToEdit?.date != nil {
                
                
                let date = itemToEdit?.date
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM dd, yyyy"
                dateFromString = formatter.string(from: date! as Date)
                
            }else{
                
                dateFromString = "Haven't Been Here Yet"
            }
            
            datePicker.text = dateFromString
            
            
        }
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        let item = itemToEdit
        performSegue(withIdentifier: "ItemDetailsVCCompleted", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailsVCCompleted" {
            if let destination = segue.destination as? ItemDetailsVCCompleted {
                destination.itemToEdit = itemToEdit
            }
        }
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            
            if item.notes == nil {
                
                print("No Notes Yet")
                
            } else {
                
                notesField.text = item.notes
                
            }
            
            if item.location == nil {
                
                print("Haven't Been Here Yet")
                
            } else {
                
                locationLabel.text = item.location
                
            }
            
            if item.date == nil {
                
                print("Haven't Been Here Yet")
                
            } else {
                
                datePicker.text = "\(item.date!)"
                
            }
            
            if item.toImage == nil {
                
                thumbImage.image = UIImage(named: "photo.png")
                
            } else {
                
                thumbImage.image = item.toImage?.image as? UIImage
                
            }
        }
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
}
