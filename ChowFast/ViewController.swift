//
//  ViewController.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 6/16/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var logInViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()

    let locationManager = CLLocationManager()
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString:"B9407F30-F5F8-466E-AFF9-25556B57FE6D"), identifier: "beacon77")
    var enteredRegion = false
    
    func sendLocalNotificationWithMessage(message: String!){
        let notification:UILocalNotification = UILocalNotification()
        notification.alertBody = message
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(locationManager.respondsToSelector("requestAlwaysAuthorization"))
        {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
        locationManager.requestStateForRegion(beaconRegion)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        NSLog("didRangeBeacon")
        var message:String = ""
        
        if(beacons.count > 0){
            let nearestBeacon:CLBeacon = beacons[0] as! CLBeacon
            
            switch nearestBeacon.proximity{
            case CLProximity.Far:
                message = "You are far away"
            case CLProximity.Near:
                message = "You are near"
            case CLProximity.Immediate:
                message = "You are in immediate"
            case CLProximity.Unknown:
                return
            }
        }else{
            message = "No beacons nearby"
        }
        NSLog("%@", message)
        sendLocalNotificationWithMessage(message)
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        enteredRegion = true
        manager.startRangingBeaconsInRegion(beaconRegion)
        manager.startUpdatingLocation()
        var alertView = UIAlertView(title: "Beacon Detected", message: "asadasd", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        enteredRegion = false
        manager.stopRangingBeaconsInRegion(region as! CLBeaconRegion)
        manager.stopUpdatingLocation()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil){
            
            self.logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.DismissButton 
            
            var logInLogoTitle = UILabel()
            logInLogoTitle.text = "ChowFast"
            
            self.logInViewController.logInView?.logo = logInLogoTitle
            
            self.logInViewController.delegate = self
            
            var signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "ChowFast Food Ordering"
            
            self.signUpViewController.signUpView?.logo = signUpLogoTitle
            self.signUpViewController.delegate = self
            self.logInViewController.signUpController = self.signUpViewController
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //Parse Login
        
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username:String, password:String) -> Bool {
        
        if(!username.isEmpty || !password.isEmpty){
            return true
        }else{
            return false
        }
        
    }
            
    
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
            
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
        
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
            println("Failed to login...")
        }
    
    //Parse Signup
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   

    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
            
        println("Failed to sign up")
            
    }
        
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("User dismissed sign up")
    }
    
    // Actions
    
    @IBAction func SignUpAction(sender: AnyObject) {
        
        self.presentViewController(self.logInViewController, animated: true, completion: nil)
    }
    
    @IBAction func SignIn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signIn", sender: self)
    }

    
    
    @IBAction func Logout(sender: AnyObject) {
        PFUser.logOut()
    }
    

}

