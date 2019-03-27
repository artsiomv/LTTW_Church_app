//
//  MessagesViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/9/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
//import SQLite3

class EventsViewController: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate, EventsDBProtocol{
    
    //    var database: Connection!
    //    var db: OpaquePointer?
    //    var downloaded = true
    
    var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    let transition = PopAnimator()
    var feedItems: NSArray = NSArray()
    var selectedEvent : EventInfoModel = EventInfoModel()
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let eventDBmodel = EventsDBModel()
        //        let sqLiteDB = SQLiteDBManager()
        eventDBmodel.delegate = self
        eventDBmodel.downloadItems()
        
        
        backButton.target = self
        backButton.action = #selector(actionClose)
    }
    
    //what happens when user clicks back button
    @objc func actionClose(_ tap: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.tableView.reloadData()
    }
    //counts how many rows there is in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    //creates the rows in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventCellModel
        // Get the event to be shown
        let item: EventInfoModel = feedItems[indexPath.row] as! EventInfoModel
        // Get references to labels of cell
        cell.titleLabel!.text = item.title
        //set the date
        let s = item.startDate?.month
        let str = month[s!-1] + " " + (item.startDate?.day?.description)!
        
        let t = item.endDate?.month
        let str2 = month[t!-1] + " " + (item.endDate?.day?.description)!
        
        if str != str2  {
            cell.dateLabel!.text = str + " - " + str2
        } else {
            cell.dateLabel!.text = str
        }
        
        //set the image from the server
        let imageURLString = "http://app.lttwchurch.org/uploads/" + item.imageName!
        let url = URL(string: imageURLString)
        cell.myImageView.load(url: url!)
        
        return cell
    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        // Set selected message to var
        selectedEvent = feedItems[indexPath.row] as! EventInfoModel
        // Manually call segue to detail view controller

        let openEvent = storyBoard.instantiateViewController(withIdentifier: "EventDetailsModel") as! EventDetailsModel


        openEvent.selectedEvent = selectedEvent
        openEvent.transitioningDelegate = self
        self.present(openEvent, animated: true, completion: nil)
    }
    
    
    //animation staff
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame =
            tableView!.convert(tableView.rectForRow(at: tableView.indexPathForSelectedRow!), to: nil)
        
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
    
    
}
