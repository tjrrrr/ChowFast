//
//  CustomLoginViewController.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 6/16/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import UIKit
import Parse

class CustomLoginViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.actInd.center = self.view.center
        
        self.actInd.hidesWhenStopped = true
        
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginAction(sender: AnyObject) {

        var username = self.usernameField.text
        var password = self.passwordField.text
        
        if (count(username.utf16) < 4 || count(password.utf16) < 5){
            
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 8 and Password must be greater than 5", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }else{
            
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if((user) != nil) {
                    var alert = UIAlertView(title: "Success", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }else{
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
                
        })
    }
    }

    @IBAction func signUpAction(sender: AnyObject) {
        self.performSegueWithIdentifier("signUp", sender: self) 
    }
}
