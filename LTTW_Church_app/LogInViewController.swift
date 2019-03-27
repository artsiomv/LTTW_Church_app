//
//  LogInViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 3/14/19.
//  Copyright © 2019 Artiom. All rights reserved.
//
import UIKit
import WebKit

class LogInViewController: UIViewController, UIViewControllerTransitioningDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        // Do any additional setup after loading the view.
        backButton.target = self
        backButton.action = #selector(actionClose)
        
        let url = URL(string: "https://www.app.lttwchurch.org/LTTW_app_php/")
        myWebView.load(URLRequest(url: url!))
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
