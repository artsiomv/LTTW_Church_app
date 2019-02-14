//
//  UploadViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var myDescription: UITextView!
    @IBOutlet weak var selectedFileName: UILabel!
    @IBOutlet weak var selectFile: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var myTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitle.delegate = self
        myDescription.delegate = self
        self.hideKeyboard()
    }
    
    //save Title information
    var titleText = ""
    @IBAction func myTitle(_ sender: Any) {
        titleText = myTitle.text!
    }
    
    
    
    //upload button tapped
    @IBAction func uploadTapped(_ sender: Any) {
        
        print(titleText)
        
    }
    
    //back button tapepd go back to home page
    @IBAction func backButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
}

extension UploadViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UploadViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
