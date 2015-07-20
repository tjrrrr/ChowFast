//
//  AppDelegate.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 6/16/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.enableLocalDatastore()
        Parse.setApplicationId("v6u30rginkubKbCIDjeqOEYSHeRmLZaFItLXV3sf",
            clientKey: "ICbFqmbZ1Ye6urbZUag34NKObaoq4tn2Bpy5jI9m")
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes:UIUserNotificationType.Alert, categories: nil))

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func applicationDidFinishLaunching(application: UIApplication) {
        //locationManager.requestAlwaysAuthorization()
        //locationManager.delegate = self
    }
    
//    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        
//        switch status{
//        
//        case .AuthorizedAlways:
//            locationManager.startMonitoringForRegion(nest71Region)
//            locationManager.startRangingBeaconsInRegion(nest71Region)
//            locationManager.requestStateForRegion(nest71Region)
//        
//        case .Denied:
//            let alert = UIAlertController(title: "Warning", message: "Location update is disabled, pls go to phone settings and change the permissions", preferredStyle: UIAlertControllerStyle.Alert)
//            let alertaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ (UIAlertAction) -> Void in}
//            alert.addAction(alertaction)
//            self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
//        default:
//            println("Default Case")
//            
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!){
//        switch state{
//        
//        case .Unknown:
//            println("Unknown")
//        
//        case .Inside:
//            var text : String = "Tap to enter ChowFast Food Ordering"
//            if enteredRegion{
//                text = "Welcome to ChowFast, your best food ordering system"
//            }
//            Notifications.display(text)
//        
//        case .Outside:
//            var text : String = "You have left the beacon coverred area, pls get back to receive more promotions"
//            if !enteredRegion{
//                text = "Have you made your food order? Pls dont leave this amazing region"
//            }
//            Notifications.display(text)
//        }
//    }
//    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
//        NSLog("didRangeBeacon")
//        var message:String = " "
//        
//        if(beacons.count > 0){
//            let nearestBeacon:CLBeacon = beacons[0] as! CLBeacon
//            
//            switch nearestBeacon.proximity{
//            case CLProximity.Far:
//                message = "You are far away"
//            case CLProximity.Near:
//                message = "You are near"
//            case CLProximity.Immediate:
//                message = "You are in immediate"
//            case CLProximity.Unknown:
//                return
//            }
//        }else{
//            message = "No beacons nearby"
//        }
//        NSLog("%@", message)
//        sendLocalNotificationWithMessage(message)
//    }
//    
//    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
//        enteredRegion = true
//        var alertView = UIAlertView(title: "Beacon Detected", message: "asadasd", delegate: self, cancelButtonTitle: "OK")
//        alertView.show()
//    }
//    
//    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
//        enteredRegion = false
//    }


}

