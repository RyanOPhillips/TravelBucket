//
//  SignInViewController.swift
//  TravelBucket
//
//  Created by Ryan Phillips on 6/1/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import LocalAuthentication

class SignInViewController: UIViewController {
    
    //    @IBOutlet weak var loginWebView: UIWebView!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
//    @IBAction func useTouchIDButtonWasPressed(_ sender: Any) {
//        let authenticationContext = LAContext()
//        var error: NSError?
//        
//        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "TouchID Required", reply: { (success, error) in
//                if success {
//                    self.navigateToAuthenticatedVc()
//                } else {
//                    if let error = error as? NSError {
//                        let message = self.errorMessageForLAErrorCode(errorCode: error.code)
//                        self.showAlertViewAfterEvaluatingPolicyWithMessage(message: message)
//                    }
//                }
//            })
//            
//            //            Code for Touch ID, Navigating to Next Page, Handling Errors
//        }else{
//            showAlertViewForNoBiometrics()
//            return
//        }
//        
//    }
//    
//    func showAlertViewAfterEvaluatingPolicyWithMessage(message: String) {
//        showAlertWithTitle(title: "Error", message: message)
//    }
//    
//    func errorMessageForLAErrorCode(errorCode: Int) -> String {
//        var message = ""
//        
//        switch errorCode {
//        case LAError.appCancel.rawValue:
//            message = "Authentication was cancelled by application"
//            
//        case LAError.authenticationFailed.rawValue:
//            message = "The user failed to provide valid credentials"
//            
//        case LAError.invalidContext.rawValue:
//            message = "The context is invalid"
//            
//        case LAError.passcodeNotSet.rawValue:
//            message = "Passcode is not set on device"
//            
//        case LAError.systemCancel.rawValue:
//            message = "Authentication was cancelled by the system"
//            
//        case LAError.touchIDLockout.rawValue:
//            message = "Too many failed attempts"
//            
//        case LAError.touchIDNotAvailable.rawValue:
//            message = "TouchID is not available on this device"
//            
//        case LAError.userCancel.rawValue:
//            message = "The user did cancel"
//            
//        case LAError.userFallback.rawValue:
//            message = "The user chose to use the fallback"
//            
//        default:
//            message = "Did not find error code on LAError object"
//        }
//        return message
//    }
//    
//    func navigateToAuthenticatedVc(){
//        
//        if let loggedInVC = storyboard?.instantiateViewController(withIdentifier: "LoggedInVC"){
//            DispatchQueue.main.async {
//                self.navigationController?.pushViewController(loggedInVC, animated: true)
//            }
//        }
//    }
//    
//    func showAlertViewForNoBiometrics() {
//        showAlertWithTitle(title: "Error", message: "This device does not have a TouchID sensor.")
//    }
//    
//    func showAlertWithTitle(title: String, message: String) {
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        
//        alertVC.addAction(okAction)
//        
//        DispatchQueue.main.async {
//            self.present(alertVC, animated: true, completion: nil)
//        }
//    }
}
