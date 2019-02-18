//
//  MenuViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/9/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var tableView: UITableView!
    let transition = PopAnimator()
    
    var collectionData = ["Home", "Give", "Downloads", "Settings"]
    var collectionImage = ["homeWhite", "giveWhite", "downloadWhite", "settingsWhite"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return collectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create and object cell from MyTableViewCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)  as! MenuTableViewCell
        
        //CHANGE THE LABELS AND PICTURES FOR THE COLLECTION VIEWS
        cell.myImage!.image = UIImage(named: collectionImage[indexPath.row])
        cell.myLabel.text = collectionData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 0 {
            //open the correct view on each tap on home page
            let viewController = storyBoard.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
            //        messagesViewController.transitioningDelegate = self
            self.present(viewController, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "GiveViewController") as! GiveViewController
            viewController.transitioningDelegate = self
            self.present(viewController, animated: true, completion: nil)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
