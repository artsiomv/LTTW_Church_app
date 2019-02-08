//
//  CollectionViewCell.swift
//  LTTW_Church_app
//
//  Created by Artiom on 1/30/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myShadow: UIView!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    func printsomething() {
        myShadow.backgroundColor = UIColor.black
        myShadow.alpha = 0.8
        myShadow.layer.shadowColor = UIColor.black.cgColor
        
        myShadow.layer.shadowOffset = CGSize(width: 0, height: -7)
        myShadow.layer.shadowOpacity = 1
        myShadow.layer.shadowRadius = 5.0
        myShadow.layer.shadowPath = UIBezierPath(rect: myShadow.bounds).cgPath
        myShadow.layer.shouldRasterize = true
    }
}
