//
//  ExpandedViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/12/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class ExpandedViewController: UIViewController {
    
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var datePicker: UILabel!
    
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if itemToEdit != nil {
            loadItemData()
            
            
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
        }
    }
}
