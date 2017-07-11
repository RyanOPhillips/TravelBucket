//
//  ItemDetailsVCCompleted.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/7/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class ItemDetailsVCCompleted: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var notesField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var thumbImage: UIImageView!
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if itemToEdit != nil {
            loadItemData()
            
        }
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ItemDetailsVCCompleted.dismissKeyboard))
        
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        _ = dateFormatter.string(from: datePicker.date)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            // ...
        }
        super.touchesBegan(touches, with: event)
    }
    
    
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        
        let picture = Image(context: context)
        picture.image = thumbImage.image
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            
            item = itemToEdit!
        }
        
        item.toImage = picture
        
        if let notes = notesField.text {
            item.notes = notes
        }
        let date = datePicker.date
        item.date = date as NSDate
        
        ad.saveContext()
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        
        for aViewController:UIViewController in viewControllers {
            if aViewController.isKind(of: BucketListViewController.self) {
                _ = self.navigationController?.popToViewController(aViewController, animated: true)
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
            
            if item.date == nil {
                
                print("Haven't Been Here Yet")
                
            } else {
                
                datePicker.date = item.date! as Date
                
            }
            
            if item.toImage == nil {
                
                thumbImage.image = UIImage(named: "photo.png")
                
            } else {
                
                thumbImage.image = item.toImage?.image as? UIImage
                
            }
        }
        
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        
        for aViewController:UIViewController in viewControllers {
            if aViewController.isKind(of: BucketListViewController.self) {
                _ = self.navigationController?.popToViewController(aViewController, animated: true)
            }
            
        }
        
    }
    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage{
            thumbImage.image = img
        }else{
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
}
