//
//  MessagesViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/9/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
//import SQLite3

class MessagesViewController: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate, MessageDBProtocol{
    
//    var database: Connection!
//    var db: OpaquePointer?
    var downloaded = true
    let transition = PopAnimator()
    var feedItems: NSArray = NSArray()
    var selectedMessage : VideoInfoModel = VideoInfoModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
//    var selectedMessage : VideoInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let messageDBmodel = MessageDBmodel()
//        let sqLiteDB = SQLiteDBManager()
        messageDBmodel.delegate = self
        messageDBmodel.downloadItems()
     
//        do {
//            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//                .appendingPathComponent("HeroesDatabase.sqlite")
//
//            //opening the database
//            if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//                print("error opening database")
//            }
//
//            //creating table
//            if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Heroes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, powerrank INTEGER)", nil, nil, nil) != SQLITE_OK {
//                let errmsg = String(cString: sqlite3_errmsg(db)!)
//                print("error creating table: \(errmsg)")
//            }
//
//
//            //getting values from textfields
//
//            //validating that values are not empty
//
//            //creating a statement
//
//            //the insert query
//
//             //preparing the query
//
//            //binding the parameters
//
//             //executing the query to insert values
//
//        } catch {
//            print(error)
//        }
        
        backButton.target = self
        backButton.action = #selector(actionClose)
    }
    
    func createTable() {
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MessagesCellModel
        // Get the location to be shown
        let item: VideoInfoModel = feedItems[indexPath.row] as! VideoInfoModel
        // Get references to labels of cell
        cell.myTitle!.text = item.title
         let imageURLString = "http://app.lttwchurch.org/uploads/" + item.imageName!
        let url = URL(string: imageURLString)
        cell.myPic.load(url: url!)
//        cell.myPic!.image = load("http://app.lttwchurch.org/uploads/" + item.imageName!)
//            "http://app.lttwchurch.org/uploads/" + item.imageName!
        
        
        
//        var str = item.title! + "," + item.speaker! + "," + item.dateSpoken
//        var str2 = item.dateSpoken
//        print(str2)
//        let queryString = "INSERT INTO Heroes (title, image, speaker, date) VALUES ("
//            + item.title! + ","
//            + cell.myPic!.image + ","
//            + item.speaker! + ","
//            + item.dateSpoken! + ")"
//
//            print(queryString)
        
        return cell
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
