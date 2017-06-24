//
//  BucketListViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/2/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //        generateTestData()
        attemptFetch()
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let objs = controller.fetchedObjects , objs.count > 0 {
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ExpandedViewController", sender: item)
            
            print(item)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExpandedViewController" {
            if let destination = segue.destination as? ExpandedViewController {
                if let item = sender as? Item{
                    destination.itemToEdit = item
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print ("\(error)")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        self.controller = controller as! NSFetchedResultsController<Item>
        
        switch(type) {
            
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    //    func generateTestData() {
    //        let item = Item(context: context)
    //        item.name = "Eiffel Tower"
    //        item.date = Date() as NSDate
    //        item.notes = "This is what it was like when I visited the Eiffel Tower"
    //        item.lat = 2.2945
    //        item.long = 48.8584
    //
    //        let item2 = Item(context: context)
    //        item2.name = "Great Pyramid of Giza"
    //        item2.date = Date() as NSDate
    //        item2.notes = "When I visited the Great Pyramids, it was very hot and sunny"
    //        item2.lat = 31.1342
    //        item2.long = 29.9792
    //
    //        let item3 = Item(context: context)
    //        item3.name = "Sydney Opera House"
    //        item3.date = Date() as NSDate
    //        item3.notes = "The Sydney Opera House was amazing! It's so much bigger than you would think"
    //        item3.lat = 151.2153
    //        item3.long = 33.8568
    //
    //        let item4 = Item(context: context)
    //        item4.name = "Statue of Liberty"
    //        item4.date = Date() as NSDate
    //        item4.notes = "I will never forget when I first saw the Statue of Liberty"
    //        item4.lat = 74.0445
    //        item4.long = 40.6892
    //
    //        let item5 = Item(context: context)
    //        item5.name = "Giant's Causeway"
    //        item5.date = Date() as NSDate
    //        item5.notes = "My friend from Ireland took me to see the Giant's Causeway. It was cold and rainy"
    //        item5.lat = 6.5116
    //        item5.long = 55.2408
    //
    //        let item6 = Item(context: context)
    //        item6.name = "Great Wall of China"
    //        item6.date = Date() as NSDate
    //        item6.notes = "It was very warm, but I enjoyed seeing this with my family."
    //        item6.lat = 116.5704
    //        item6.long = 40.4319
    //
    //        ad.saveContext()
    //        }
    
    
}


