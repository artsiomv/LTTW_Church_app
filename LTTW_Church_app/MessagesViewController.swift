//
//  MessagesViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/9/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate, MessageDBProtocol{
    
    
    let transition = PopAnimator()
    var feedItems: NSArray = NSArray()
    var selectedMessage : VideoInfoModel = VideoInfoModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let messageDBmodel = MessageDBmodel()
        messageDBmodel.delegate = self
        messageDBmodel.downloadItems()
        
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
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: VideoInfoModel = feedItems[indexPath.row] as! VideoInfoModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.title
        
        return myCell
    }

    
    
    //change hte first row to be larger and keep everything separate
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0{
//            return 250.0
//        }
//        return 170.0
//    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        // Set selected message to var
        selectedMessage = feedItems[indexPath.row] as! VideoInfoModel
        // Manually call segue to detail view controller
        
        let openMessage = storyBoard.instantiateViewController(withIdentifier: "MessageDetailsModel") as! MessageDetailsModel
        
        
        openMessage.selectedMessage = selectedMessage
        openMessage.transitioningDelegate = self
        self.present(openMessage, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        // Get reference to the destination view controller
//        let detailVC  = segue.destination as! MessageDetailsModel
        // Set the property to the selected location so when the view for
        // detail view controller loads, it can access that property to get the feeditem obj
//        detailVC.selectedMessage = selectedMessage
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
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
