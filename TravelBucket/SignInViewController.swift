//
//  SignInViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/1/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginWebView: UIWebView!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       loginIndicator.startAnimating()
    }
    
}
