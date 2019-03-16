//
//  SettingsViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 3/14/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {
    let transition = PopAnimator()
    @IBOutlet weak var tableView: UITableView!
    let rows = SettingsModel.all()
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBAction func SignInTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create and object cell from MyTableViewCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsRow", for: indexPath)  as! SettingsTableViewCellModel
        
        cell.leftImage!.image = UIImage(named: rows[indexPath.row].image)
        cell.myLabel!.text = rows[indexPath.row].title
        cell.rightImage!.image = UIImage(named: rows[indexPath.row].imageRight)
        
       
        return cell
    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //open the correct view on each tap on home page
        if indexPath.row == 0 {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
            viewController.transitioningDelegate = self
            self.present(viewController, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "DoNotDisturbViewController") as! DoNotDisturbViewController
            viewController.transitioningDelegate = self
            self.present(viewController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            viewController.transitioningDelegate = self
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.tableView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        backButton.target = self
        backButton.action = #selector(actionClose)
    }
    
    //what happens when user clicks back button
    @objc func actionClose(_ tap: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //animation staff
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.originFrame =
//            tableView!.convert(tableView.rectForRow(at: tableView.indexPathForSelectedRow!), to: nil)
//
//        transition.presenting = true
//        return transition
//    }
    
    //what happens when back button pressed, run the animation
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.presenting = false
//        return transition
//    }

}
