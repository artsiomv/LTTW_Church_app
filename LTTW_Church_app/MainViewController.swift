//
//  MainViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/7/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
let rows = TableCellModel.all()

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate{
    
    let transition = PopAnimator()
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    //Here is to change pictures, labels, shadows for each of the rows on main page
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create and object cell from MyTableViewCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)  as! MyTableViewCell
        
        cell.myImage!.image = UIImage(named: rows[indexPath.row].image)
        cell.myLabel!.text = rows[indexPath.row].title
        
        //draw a shadow on the bottow of each row, called from MyTableViewCell.swift
        cell.drawShadow()
        
        return cell
    }
    
    //change hte first row to be larger and keep everything separate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 250.0
        }
        return 170.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        //open the correct view on each tap on home page
        if indexPath.row == 0 {
//            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
            let messagesViewController = storyBoard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
            messagesViewController.transitioningDelegate = self
            self.present(messagesViewController, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let eventsViewController = storyBoard.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
            eventsViewController.transitioningDelegate = self
            self.present(eventsViewController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let bibleViewController = storyBoard.instantiateViewController(withIdentifier: "BibleViewController") as! BibleViewController
            bibleViewController.transitioningDelegate = self
            self.present(bibleViewController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            let notesViewController = storyBoard.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
            notesViewController.transitioningDelegate = self
            self.present(notesViewController, animated: true, completion: nil)
        } else if indexPath.row == 4 {
            let getInvolvedViewController = storyBoard.instantiateViewController(withIdentifier: "GetInvolvedViewController") as! GetInvolvedViewController
            getInvolvedViewController.transitioningDelegate = self
            self.present(getInvolvedViewController, animated: true, completion: nil)
        } else if indexPath.row == 5 {
            let aboutUsViewController = storyBoard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            aboutUsViewController.transitioningDelegate = self
            self.present(aboutUsViewController, animated: true, completion: nil)
        }
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
