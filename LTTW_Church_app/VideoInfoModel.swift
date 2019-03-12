//
//  VideoInfoModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import Foundation

class VideoInfoModel: NSObject {
    //properties
    var title: String?
    var videoURL: String?
    var imageName: String?
    var speaker: String?
    var dateSpoken: DateComponents?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(title: String, videoURL: String, imageName: String, speaker: String, dateSpoken: DateComponents) {
        
        self.title = title
        self.videoURL = videoURL
        self.imageName = imageName
        self.speaker = speaker
        self.dateSpoken = dateSpoken
        
        
        //WHAT IF I ADD TO SQLITE HERE?????
        
        
    }
    
    
    //prints object's current state
    
//    override var description: String {
//        return "title: \(String(describing: title)), videoName: \(String(describing: videoName)), imageName: \(String(describing: imageName)), speaker: \(String(describing: speaker))"
//        
//    }
}
