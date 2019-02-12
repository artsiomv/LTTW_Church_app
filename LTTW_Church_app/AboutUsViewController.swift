//
//  AboutUsViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/7/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController , UIViewControllerTransitioningDelegate {

    @IBOutlet weak var backButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.target = self
        backButton.action = #selector(actionClose)
    }
    
    @objc func actionClose(_ tap: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
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
