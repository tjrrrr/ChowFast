//
//  Notifications.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 7/17/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import Foundation
import UIKit

class Notifications {
    
    class func display(text: String){
        
        let notification: UILocalNotification = UILocalNotification()
        notification.timeZone = NSTimeZone.defaultTimeZone()
        let dateTime = NSDate()
        notification.fireDate = dateTime
        notification.alertBody = text
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}
