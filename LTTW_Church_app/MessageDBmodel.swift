//
//  MessageDBmodel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

import Foundation

protocol MessageDBProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class MessageDBmodel: NSObject, URLSessionDataDelegate {

    //properties
    
    weak var delegate: MessageDBProtocol!
    
    let urlPath = "https://app.lttwchurch.org/messages.php" //this will be changed to the path where service.php lives
    
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
        let messages = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let message = VideoInfoModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let videoDescription = jsonElement["videoDescription"] as? String,
                let fileName = jsonElement["fileName"] as? String,
                let fileExtension = jsonElement["fileExtension"] as? String,
                let title = jsonElement["title"] as? String
            {
                message.title = title
                message.videoDescription = videoDescription
                message.fileName = fileName
                message.fileExtension = fileExtension
                print(fileName)
            }
            
            messages.add(message)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: messages)
            
        })
    }
    
}
