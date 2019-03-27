//
//  TableCellModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/10/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

struct TableCellModel {

    let title: String
    let image: String
    
    static func all() -> [TableCellModel] {
        return [
            TableCellModel(title: "MESSAGE", image: "pic1.jpg"),
            TableCellModel(title: "EVENTS", image: "pic2.jpg"),
            TableCellModel(title: "GET INVOLVED", image: "pic5.jpg"),
            TableCellModel(title: "GIVE", image: "Pushpay_logo_Red_RGB_Wordmark_Stacked.jpeg"),
//            TableCellModel(title: "DOWNLOADS", image: "pic6.jpg"), //https://stackoverflow.com/questions/38347865/download-youtube-video-in-ios-swift
            TableCellModel(title: "ABOUT US", image: "pic6.jpg")
            
        ]
    }
    
}
