//
//  ItemDetailsVCCompleted.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/7/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class ItemDetailsVCCompleted: UIViewController {

    
    @IBOutlet weak var notesField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if itemToEdit != nil {
            loadItemData()
            
            
        }
    
    }

    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        _ = dateFormatter.string(from: datePicker.date)
    }
    
    
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let item = Item(context: context)
        
        if let notes = notesField.text {
            item.notes = notes
        }
        let date = datePicker.date
            item.date = date as NSDate
        
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            notesField.text = item.notes
            datePicker.date = item.date! as Date
        }
        
    }
}
