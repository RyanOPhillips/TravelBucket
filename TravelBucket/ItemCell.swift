//
//  ItemCell.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/7/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var itemDate: UILabel!
    @IBOutlet weak var cityLocation: UILabel!
    
    func configureCell(item: Item) {
        
        var dateFromString = ""
        
        if item.date != nil {
            
            
            let date = item.date
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM dd, yyyy"
            dateFromString = formatter.string(from: date! as Date)
            
        }else{
            
            dateFromString = "Haven't Been Here Yet"
        }
        
        if item.toImage == nil {
            
            thumb.image = UIImage(named: "photo.png")
            
        } else {
            
            thumb.image = item.toImage?.image as? UIImage
            
        }
        name.text = item.name
        itemDate.text = dateFromString
        cityLocation.text = item.location
    }
    
    
    
}
