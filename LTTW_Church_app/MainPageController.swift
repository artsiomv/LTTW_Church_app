//
//  MainPageController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/6/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MainPageController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    var collectionData = ["1", "2", "3", "4", "5", "6", "7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = (view.frame.size.width - 30) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! MyCollectionViewCell
//        if let label = cell.viewWithTag(100) as? UILabel {
//            label.text = collectionData[indexPath.row]
//            label.text = "HI"
//        }
        //HERE I WILL CHANGE THE LABELS AND PICTURES FOR THE COLLECTION VIEWS
        cell.myLabel.text = "HI"
        
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
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

