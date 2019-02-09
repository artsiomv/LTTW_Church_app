//
//  MyTableViewCell.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/8/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myShadow: UIView!
    @IBOutlet weak var myLabel: UILabel!
    
    //draw a shadow for each row on main page
    func drawShadow() {
        myShadow.backgroundColor = UIColor.black
        myShadow.alpha = 0.7
        myShadow.layer.shadowColor = UIColor.black.cgColor
        
        myShadow.layer.shadowOffset = CGSize(width: 0, height: -20)
        myShadow.layer.shadowOpacity = 1
        myShadow.layer.shadowRadius = 10.0
        myShadow.layer.shadowPath = UIBezierPath(rect: myShadow.bounds).cgPath
        myShadow.layer.shouldRasterize = true
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
