//
//  Item+CoreDataProperties.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/13/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var toImage: Image?

}
