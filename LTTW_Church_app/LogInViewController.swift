//
//  LogInViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 3/14/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
class LogInViewController: UIViewController, UIViewControllerTransitioningDelegate, UserDBProtocol {
    
    
    var feedItems: NSArray = NSArray()
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
    }
   
    @IBAction func onClick(_ sender: Any) {
        errorMessage.text = ""
        //TODO encrypt password

        if(loginInput.text! == "" || passwordInput.text! == "") {
            errorMessage.text = "Username or password is missing"
        } else {
            //need to download data here
            errorMessage.text = "Loading..."
            let item: UserInfoModel = feedItems[0] as! UserInfoModel
            if item.login! == loginInput.text! && item.password! == passwordInput.text! {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let viewController = storyBoard.instantiateViewController(withIdentifier: "DangerViewController") as! DangerViewController
                viewController.transitioningDelegate = self
                self.present(viewController, animated: true, completion: nil)
            } else {
                errorMessage.text = "Login or password is incorrect"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        backButton.target = self
        backButton.action = #selector(actionClose)
        
        let userDBmodel = UserDBModel()
        userDBmodel.delegate = self
        userDBmodel.downloadItems()
    }
    
    //what happens when user clicks back button
    @objc func actionClose(_ tap: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
//    //animation staff
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.originFrame =
//            tableView!.convert(tableView.rectForRow(at: tableView.indexPathForSelectedRow!), to: nil)
//
//        transition.presenting = true
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.presenting = false
//        return transition
//    }
}
