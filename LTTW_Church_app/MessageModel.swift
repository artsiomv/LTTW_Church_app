//
//  MessageModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

import Foundation

class MessageModel: NSObject {
    //properties
    
    var messageDescription: String?
    var fileName: String?
    var fileextension: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(messageDescription: String, filename: String, fileextension: String) {
        
        self.messageDescription = messageDescription
        self.fileName = filename
        self.fileextension = fileextension
        print("YP")
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Description: \(String(describing: messageDescription)), Name: \(String(describing: fileName)), FileExtension: \(String(describing: fileextension)))"
        
    }
}
