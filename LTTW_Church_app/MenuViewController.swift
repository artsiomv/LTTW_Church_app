//
//  MenuViewController.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/9/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var collectionData = ["Home", "Give", "Downloads", "Settings"]
    var collectionImage = ["homeWhite", "giveWhite", "downloadWhite", "settingsWhite"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return collectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create and object cell from MyTableViewCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)  as! MenuTableViewCell
        
        //CHANGE THE LABELS AND PICTURES FOR THE COLLECTION VIEWS
        cell.myImage!.image = UIImage(named: collectionImage[indexPath.row])
        cell.myLabel.text = collectionData[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
