//
//  SignInViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/1/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import Auth0
import Lock

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginWebView: UIWebView!
//    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        loginIndicator.startAnimating()
        loginWebView.loadRequest(URLRequest(url: URL(string: "https://ryanphillips.auth0.com/login?client=aMNM-yN36nC4FleD9G_L9rk1-gckAsNA")!))
        // Do any additional setup after loading the view, typically from a nib.
        Auth0
            .webAuth()
            .start {
                switch $0 {
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                case .success(let credentials):
                    // Do something with credentials e.g.: save them.
                    // Auth0 will automatically dismiss the hosted login page
                    print("Credentials: \(credentials)")
                    
                    
                }
                
        }
        Lock
            .classic()
            // withConnections, withOptions, withStyle, etc
            .onAuth { credentials in
                // Save the Credentials object
            }
            .present(from: self)
    }
    
    

}

