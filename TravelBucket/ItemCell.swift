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
        
        name.text = item.name
        itemDate.text = "\(item.date!)"
        cityLocation.text = ""
        thumb.image = item.toImage?.image as? UIImage
    }
    
    //Add Google Places API Here
}
