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
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }
    

    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
    }
    
    
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let item = Item(context: context)
        
        let notes = notesField.text
            item.notes = notes
        
        
        
    }
    
 
}
