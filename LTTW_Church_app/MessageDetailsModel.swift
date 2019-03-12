//
//  MessageDetailsModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//
//import XCDYouTubeKit
import UIKit
import WebKit
//import AVKit


class MessageDetailsModel: UIViewController, UIViewControllerTransitioningDelegate {

    
    var selectedMessage : VideoInfoModel?
    var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var myDate: UILabel!
//    var player:AVPlayer?
    @IBOutlet weak var myBigTitle: UINavigationItem!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var mySpeaker: UILabel!
    @IBOutlet weak var webViewVideo: WKWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.youtube.com/embed/" + selectedMessage!.videoURL!)
        webViewVideo.load(URLRequest(url: url!))
        //set the proportionate width and height for the video box
//        myVideo.frame.size.myViewWidthConstant.constant = 200
//        myVideo.frame = CGRect(x: parentView.frame.minX, y: navBar.frame.maxY, width: parentView.frame.maxX, height: (parentView.frame.maxX * 0.0833333333) * 9)
        // Do any additional setup after loading the view.
        //action on back button press
        backButton.target = self
        backButton.action = #selector(actionClose)
        
        //changing the title on top and on the bottom
        myBigTitle.title = selectedMessage!.title
        myTitle.text = selectedMessage!.title
        
        //set the date
        let s = selectedMessage!.dateSpoken?.month
        let str = month[s!] + " " + (selectedMessage!.dateSpoken?.day?.description)! + ", " + (selectedMessage!.dateSpoken?.year?.description)!
        myDate.text = str
        
        mySpeaker.text = selectedMessage!.speaker
        
        
        
//        webViewVideo.load(selectedMessage!.videoURL!)// = selectedMessage!.videoURL!
        //changing the description
//        myDescription.text = selectedMessage!.videoDescription!
//        myDescription.sizeToFit()
        //changing the video *****
//        let videoURLString = selectedMessage!.videoURL!
//        let url = URL(string: videoURLString)
//        player = AVPlayer(url: url!)
////
//        let playerViewController =
//            XCDYouTubeVideoPlayerViewController(videoIdentifier: videoURLString)
//        playerViewController.present(in: myVideoUI)
//        playerViewController.player.play()
        
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//
//        myVideoUI.addSubview(playerViewController.view)
//
//        playerViewController.view.frame = myVideoUI.bounds
        
       
        

//        present(playerViewController, animated: true) {
//            self.player!.play()
//        }
    }
    //what happens when user clicks back button
    @objc func actionClose(_ tap: UIBarButtonItem) {
//        self.player!.pause()
//        self.player!.replaceCurrentItem(with: nil)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
