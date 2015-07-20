//
//  DetailViewController.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 6/23/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate {
    
    var quantity = [1,2,3,4,5]
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodDetails: UITextField!
    @IBOutlet weak var foodPrice: UITextField!
    @IBOutlet weak var foodQuantity: UIPickerView!
    @IBAction func foodOrder(sender: AnyObject) {
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component:Int) -> Int {
        return quantity.count
    }

    
    
    //Container to store the view table selected object
    var currentObject : PFObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        //Unwrap the current object's object
        if let object = currentObject {
            foodName.text = object["foodName"] as! String
            foodDetails.text = object["foodDetails"] as! String
            foodPrice.text = object["foodPrice"] as! String
        }
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

}
