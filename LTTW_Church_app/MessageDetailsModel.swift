//
//  MessageDetailsModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit
import AVKit

class MessageDetailsModel: UIViewController, UIViewControllerTransitioningDelegate {

    var selectedMessage : VideoInfoModel?
    
    var player:AVPlayer?
    @IBOutlet weak var myVideo: UIView!
    @IBOutlet weak var myBigTitle: UINavigationItem!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //action on back button press
        backButton.target = self
        backButton.action = #selector(actionClose)
        
        //changing the title on top and on the bottom
        myBigTitle.title = selectedMessage!.title!
        myTitle.text = selectedMessage!.title!
        
        //changing the description
        myDescription.text = selectedMessage!.videoDescription!
        myDescription.sizeToFit()
        //changing the video *****
        let videoURLString =
            "http://app.lttwchurch.org/uploads/" + selectedMessage!.fileName!
        let url = URL(string: videoURLString)
        player = AVPlayer(url: url!)
        
        
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        myVideo.addSubview(playerViewController.view)
        
        playerViewController.view.frame = myVideo.bounds
        
        present(playerViewController, animated: true) {
            self.player!.play()
        }
    }
    //what happens when user clicks back button
    @objc func actionClose(_ tap: UIBarButtonItem) {
        self.player!.pause()
//        self.player!.
//        self.player! = nil
        self.player!.replaceCurrentItem(with: nil)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
//    override func viewDidDisappear(_ animated: Bool) {
//        self.player?.replaceCurrentItem(with: nil)
//    }
}
