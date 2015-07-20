//
//  TableViewController.swift
//  ChowFast
//
//  Created by Thia Ji Rong on 6/23/15.
//  Copyright (c) 2015 tjr. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TableViewController: PFQueryTableViewController {


    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
    }

    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        //Configure the PFQueryTableView
        self.parseClassName = "foodMenu"
        self.textKey = "foodDetails"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    //Retrieve data from Parse for table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "foodMenu")
        query.orderByAscending("foodName")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell{
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil{
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            
        }
        //Extract the values from the PFObject
        if let foodName = object?["foodName"] as? String{
            cell?.textLabel?.text = foodName
        }
        
        if let foodDetails = object?["foodDetails"] as? String {
            cell?.detailTextLabel?.text = foodDetails
        }
        
        
        
        return cell
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue destinationViewController
        var detailScene = segue.destinationViewController as! DetailViewController
        self.performSegueWithIdentifier("detailView", sender: self)
    
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = (objects?[row] as! PFObject)
       }
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
