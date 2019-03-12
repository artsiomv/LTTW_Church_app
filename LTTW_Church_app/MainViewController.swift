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
    
//    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let transition = PopAnimator()
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var menuLabel: UILabel!
    
    
//    @IBAction func menuButton(_ sender: Any) {
//
//        self.view.bringSubviewToFront(secondView)
//        let originalTransform = self.secondView.transform
////        let scaledTransform = originalTransform.scaledBy(x: 0.2, y: 0.2)
//        let scaledAndTranslatedTransform = originalTransform.translatedBy(x: self.view.frame.maxX * 0.6, y: 0)
//        UIView.animate(withDuration: 0.7, animations: {
//            self.secondView.transform = scaledAndTranslatedTransform
////            self.menuLabel.transform = scaledAndTranslatedTransform
//        })
//    }
    
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
        
//        var startX = self.view.frame.minX
//         var startY = self.view.frame.minX
//        var width = self.view.frame.maxX * 0.6
//        var height = self.view.frame.maxY
//        secondView.frame = CGRect(
//            x: self.view.frame.minX - self.view.frame.maxX * 0.6,
//            y: self.view.frame.minY,
//            width: self.view.frame.maxX * 0.6,
//            height: self.view.frame.maxY )
        
        //LABEL
//        menuLabel.frame = CGRect(x: secondView.frame.midX, y: secondView.frame.midY, width: 50, height: 50)
    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        //open the correct view on each tap on home page
        if indexPath.row == 0 {
            let messagesViewController = storyBoard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
            messagesViewController.transitioningDelegate = self
            self.present(messagesViewController, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let eventsViewController = storyBoard.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
            eventsViewController.transitioningDelegate = self
            self.present(eventsViewController, animated: true, completion: nil)
        }  else if indexPath.row == 2 {
            let getInvolvedViewController = storyBoard.instantiateViewController(withIdentifier: "GetInvolvedViewController") as! GetInvolvedViewController
            getInvolvedViewController.transitioningDelegate = self
            self.present(getInvolvedViewController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
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
