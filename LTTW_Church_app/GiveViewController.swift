//
//  GiveViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/18/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
import WebKit

class GiveViewController: UIViewController, WKNavigationDelegate{

    
    @IBOutlet weak var loading: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var myWeb: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton.target = self
        backButton.action = #selector(actionClose)
        
        myWeb.navigationDelegate = self
        let url = URL(string: "https://pushpay.com/fsp/lighttotheworldchurch?t=8ac91fb4-aca3-0766-9aeb-02027b672f3e")
        myWeb.load(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.isHidden = true
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
