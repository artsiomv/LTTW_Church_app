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
    var videoDescription: String?
    var fileName: String?
    var fileExtension: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(title: String, videoDescription: String, fileName: String, fileExtension: String) {
        
        self.title = title
        self.videoDescription = videoDescription
        self.fileName = fileName
        self.fileExtension = fileExtension
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Description: \(String(describing: videoDescription)), Name: \(String(describing: fileName)), FileExtension: \(String(describing: fileExtension)))"
        
    }
}
