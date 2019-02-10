//
//  MainViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/7/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let transition = PopAnimator()
    @IBOutlet weak var tableView: UITableView!
    var collectionData = ["MESSAGES", "EVENTS", "NOTES", "BIBLE", "GET INVOLVED", "ABOUT US"]
    var myCell = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    //Here is to change pictures, labels, shadows for each of the rows on main page
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create and object cell from MyTableViewCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)  as! MyTableViewCell
        
        //CHANGE THE LABELS AND PICTURES FOR THE COLLECTION VIEWS
        cell.myImage!.image = UIImage(named: "pic\(indexPath.row+1)")
        cell.myLabel.text = collectionData[indexPath.row]
        
        //print(cell.center.y)
//        print(cell.myLabel.ns)
//        cell.myLabel.textAlignment = NSTextAlignment.center.rawValue
//        cell.myLabel.frame(forAlignmentRect: cell.myLabel.frame). = 50
//        cell.myLabel.textAlignment = .center
        
        
//        cell.myLabel.frame.origin.y = 10
        
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
        
        transition.dismissCompletion = {
            self.tableView!.isHidden = false
        }

    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //open the correct view on each tap on home page
        if indexPath.row == 0 {
            let messagesViewController = storyBoard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
            myCell = indexPath.row
            messagesViewController.transitioningDelegate = self
            self.present(messagesViewController, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let eventsViewController = storyBoard.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
            myCell = indexPath.row
            eventsViewController.transitioningDelegate = self
            self.present(eventsViewController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let notesViewController = storyBoard.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
            myCell = indexPath.row
            notesViewController.transitioningDelegate = self
            self.present(notesViewController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            let bibleViewController = storyBoard.instantiateViewController(withIdentifier: "BibleViewController") as! BibleViewController
            self.present(bibleViewController, animated: true, completion: nil)
        } else if indexPath.row == 4 {
            let getInvolvedViewController = storyBoard.instantiateViewController(withIdentifier: "GetInvolvedViewController") as! GetInvolvedViewController
            self.present(getInvolvedViewController, animated: true, completion: nil)
        } else if indexPath.row == 5 {
            let aboutUsViewController = storyBoard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            self.present(aboutUsViewController, animated: true, completion: nil)
        }
    }
    
//    func animationController(forPresented presented: UIViewController, didSelectRowAt indexPath: IndexPath, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.originFrame =
////            (tableView.cellForRow(at: indexPath)!.superview!.convert(
////            (tableView!.cellForRow(at: indexPath)!.frame),
////            to: nil))
//            //(tableView?.superview!.convert(tableView.cellForRow(at: indexPath)!.frame, to: nil))!
//        tableView!.superview!.convert(tableView!.frame, to: nil)
//
//        transition.presenting = true
//        //        selectedImage!.isHidden = true
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.presenting = false
//        return transition
//    }
    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.originFrame = (tableView!.cellForRow(at: tableView!.indexPathForSelectedRow!)?.superview!
//            .convert(tableView!.frame, to: nil))!
////            tableView!.superview!.convert(tableView!.frame, to: nil)
////                    print(tableView!.indexPathForSelectedRow)
//
//        transition.presenting = true
//        //        selectedImage!.isHidden = true
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.presenting = false
//        return transition
//    }
}


extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = (tableView!.cellForRow(at: tableView!.indexPathForSelectedRow!)?.superview!
            .convert(tableView!.frame, to: nil))!
        //            tableView!.superview!.convert(tableView!.frame, to: nil)
        //                    print(tableView!.indexPathForSelectedRow)
        
        transition.presenting = true
        tableView!.isHidden = true
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}
