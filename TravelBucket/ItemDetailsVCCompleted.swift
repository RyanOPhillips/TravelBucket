//
//  ItemDetailsVCCompleted.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/7/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class ItemDetailsVCCompleted: UIViewController{

    
    @IBOutlet weak var notesField: UITextField!
//    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
//        datePicker.delegate = self
//        datePicker.datasource = self

        // Do any additional setup after loading the view.
    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }
//    
//    func 
    
    
    
//    @IBAction func savePressed(_ sender: UIButton) {
//        
//        let item = Item(context: context)
//        
//        let notes = notesField.text
//            item.notes = notes
//        
//        
//        
//    }
//    
    
    
    
    
}
