//
//  VideoInfoModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import Foundation

class EventInfoModel: NSObject {
    //properties
    var title: String?
    var eventDescription: String?
    var imageName: String?
    var startTime: String?
    var startDate: DateComponents?
    var endDate: DateComponents?
    var address: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(title: String, eventDescription: String, imageName: String, startTime: String, startDate: DateComponents, endDate: DateComponents, address: String) {
        
        self.title = title
        self.eventDescription = eventDescription
        self.imageName = imageName
        self.startTime = startTime
        self.startDate = startDate
        self.endDate = endDate
        self.address = address
    }
    
    
    //prints object's current state
    
    //    override var description: String {
    //        return "title: \(String(describing: title)), videoName: \(String(describing: videoName)), imageName: \(String(describing: imageName)), speaker: \(String(describing: speaker))"
    //
    //    }
}
