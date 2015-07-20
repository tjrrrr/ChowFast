//
//  ReservationViewController.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 7/20/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    @IBOutlet weak var customerName: UITextField!
    @IBOutlet weak var PhoneNo: UITextField!
    @IBOutlet weak var reserveDate: UITextField!
    @IBAction func datePicker(sender: UITextField) {
        
        var DatePickerView : UIDatePicker = UIDatePicker()
        DatePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        reserveDate.inputView = DatePickerView
        DatePickerView.addTarget(self, action: Selector("handleDatePicker"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func btnBook(sender: AnyObject) {
        
        var name = self.customerName.text
        var phonenum = self.PhoneNo.text
        var reservationDate = self.reserveDate.text
        
        if(name.isEmpty == true && phonenum.isEmpty == true && reservationDate.isEmpty == true ){
            var alert = UIAlertView(title: "Invalid", message: "Cannot have blank info", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }else{
            var reservation = PFObject(className: "reservation")
            if let user = PFUser.currentUser() {
                reservation["Name"] = name
                reservation["PhoneNum"] = phonenum
                reservation["Date"] = reservationDate
                reservation["createdBy"] = PFUser.currentUser()
            }
            
            reservation.saveInBackgroundWithBlock{ (success: Bool, error: NSError?)-> Void in
                if(success){
                    var alert = UIAlertView(title: "Successful", message: "Reservation has been make", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                else{
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
                
            }
        

        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleDatePicker(sender: UIDatePicker){
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        reserveDate.text = dateFormatter.stringFromDate(sender.date)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
