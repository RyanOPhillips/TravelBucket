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
            notesField.text = item.notes
            datePicker.text = "\(item.date!)"
            thumbImage.image = item.toImage?.image as? UIImage
            
            
        }
    }
}
