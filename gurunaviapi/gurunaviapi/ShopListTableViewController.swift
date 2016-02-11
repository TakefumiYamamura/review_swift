//
//  ShopListTableViewController.swift
//  gurunaviapi
//
//  Created by TakefumiYamamura on 2016/02/10.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ShopListTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    var rests: [Restaurant] = []
    
    var selectedRest: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.rests.count
    }

    @IBAction func tapSearchBarButton(sender: UIBarButtonItem) {
        getData()
        textField.text = ""
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        let rest = rests[indexPath.row]
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = rest.name!
        let imageView = cell.viewWithTag(2) as! UIImageView
        if let imageString = rest.imageURL {
            let myURL = NSURL(string: imageString)
            imageView.sd_setImageWithURL(myURL!)
        } else {
            imageView.image = UIImage(named: "default_image.png")
        }


        // Configure the cell...

        return cell
    }
    
    func getData() {
        let params: [String: AnyObject] = [
            "keyid" : "7b6c4c4fa0ae54638e7ce651e4769903",
            "format" : "json",
            "name": textField.text!
        ]
        let url = "http://api.gnavi.co.jp/RestSearchAPI/20150630/"
        Alamofire.request(.GET, url, parameters: params)
            .responseJSON { (response) -> Void in

                if let object = response.result.value {
                    let jsonObject = JSON(object)
                    if let restJson = jsonObject["rest"].array {
                        for rest in restJson {
                            let restaurant = Restaurant()
                            restaurant.name = rest["name"].string
                            restaurant.url = rest["url"].string
                            restaurant.imageURL = rest["image_url"]["shop_image1"].string
                            self.rests.append(restaurant)
                        }
                    }
                    self.tableView.reloadData()
                }

        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedRest = self.rests[indexPath.row]
        self.performSegueWithIdentifier("ShowWebViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let webViewController = segue.destinationViewController as! WebViewController
        webViewController.selectedRest = self.selectedRest
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
