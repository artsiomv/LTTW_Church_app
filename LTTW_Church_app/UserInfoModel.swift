//
//  VideoInfoModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import Foundation

class UserInfoModel: NSObject {
    //properties
    var firstName: String?
    var lastName: String?
    var email: String?
    var login: String?
    var password: String?
    
    override init()
    {
        
    }
    
    init(firstName: String, lastName: String, email: String, login: String, password: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.login = login
        self.password = password
    }
    
    
    //prints object's current state
    
    //    override var description: String {
    //        return "title: \(String(describing: title)), videoName: \(String(describing: videoName)), imageName: \(String(describing: imageName)), speaker: \(String(describing: speaker))"
    //
    //    }
}
