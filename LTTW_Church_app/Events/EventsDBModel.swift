//
//  MessageDBmodel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import UIKit

import Foundation

protocol EventsDBProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class EventsDBModel: NSObject, URLSessionDataDelegate {
    //properties
    
    weak var delegate: EventsDBProtocol!
    
    let urlPath = "https://app.lttwchurch.org/events.php" //this will be changed to the path where service.php lives
    
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
            
            let event = EventInfoModel()
            
            let time = jsonElement["startTime"] as? String
            let array = time!.components(separatedBy: ":")
            var AMPM = "AM"
            if Int(array[0])! > 12 {
                AMPM = "PM"
            }
            var hour = String(Int(array[0])! % 12)
            var myTime = ""
            if array[0] != "00" {
                if(hour.count == 1) {
                    hour = "0" + hour
                }
                let minute = array[1]
                myTime = hour + ":" + minute + " " + AMPM
            }
            
            let stringStart = jsonElement["startDate"] as! String
            let stringEnd = jsonElement["endDate"] as! String
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateStart = dateFormatter.date(from: stringStart)
            let dateEnd = dateFormatter.date(from: stringEnd)
            
            let calendar = Calendar.current
            let startDateL = calendar.dateComponents([.year, .month, .day], from: dateStart!)
            let endDateL = calendar.dateComponents([.year, .month, .day], from: dateEnd!)
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let title = jsonElement["title"] as? String,
                let eventDescription = jsonElement["description"] as? String,
                let imageName = jsonElement["imageName"] as? String,
                let address = jsonElement["address"] as? String
            {
                event.title = title
                event.eventDescription = eventDescription
                event.imageName = imageName
                event.startTime = myTime
                event.startDate = startDateL
                event.endDate = endDateL
                event.address = address
            }
            messages.add(event)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: messages)
            
        })
    }
    
}
