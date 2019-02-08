//
//  MainViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/6/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    var collectionData = ["MESSAGES", "EVENTS", "NOTES", "BIBLE", "GET INVOLVED", "ABOUT US"]
    var cellCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = (view.frame.size.width - 60) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        //HERE I WILL CHANGE THE LABELS AND PICTURES FOR THE COLLECTION VIEWS
        cell.myImage.image = UIImage(named: "pic\(cellCounter+1)")
        cell.myLabel.text = collectionData[cellCounter]
        
        cellCounter += 1
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 0 {
            let messagesViewController = storyBoard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
            self.present(messagesViewController, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let eventsViewController = storyBoard.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
            self.present(eventsViewController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let notesViewController = storyBoard.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
            self.present(notesViewController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            let bibleViewController = storyBoard.instantiateViewController(withIdentifier: "BibleViewController") as! BibleViewController
            self.present(bibleViewController, animated: true, completion: nil)
        } else if indexPath.row == 4 {
            let getInvolvedViewController = storyBoard.instantiateViewController(withIdentifier: "GetInvolvedViewController") as! GetInvolvedViewController
            self.present(getInvolvedViewController, animated: true, completion: nil)
        } else if indexPath.row == 5 {
            let aboutUsViewController = storyBoard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            self.present(aboutUsViewController, animated: true, completion: nil)
        }
    }
    

}

