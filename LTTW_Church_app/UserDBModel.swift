//
//  UserDBModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

import Foundation

protocol UserDBProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class UserDBModel: NSObject, URLSessionDataDelegate {
    //properties
    
    weak var delegate: UserDBProtocol!
    
    let urlPath = "https://app.lttwchurch.org/user.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let users = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let user = UserInfoModel()
            
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let firstName = jsonElement["firstName"] as? String,
                let lastName = jsonElement["lastName"] as? String,
                let email = jsonElement["email"] as? String,
                let login = jsonElement["login"] as? String,
                let password = jsonElement["password"] as? String
            {
                user.firstName = firstName
                user.lastName = lastName
                user.email = email
                user.login = login
                user.password = password
            }
            users.add(user)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: users)
            
        })
    }
    
}
