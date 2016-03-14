//
//  SideMenuTableViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/7/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {


    var menuItemsArray = [String]()

    override func viewDidLoad() {

        menuItemsArray = ["Home","Gig Map","Band Schedule","Setlists","Pending Gigs","Add Gig", "Add Band"]
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(menuItemsArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = menuItemsArray[indexPath.row]
        
        return cell
    }

}
