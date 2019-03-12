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
    let identifier: String
    let viewID: AnyClass
    
    static func all() -> [TableCellModel] {
        return [
            TableCellModel(title: "MESSAGE", image: "pic1.jpg", identifier: "MessagesViewController", viewID: MessagesViewController.self),
            TableCellModel(title: "EVENTS", image: "pic2.jpg", identifier: "EventsViewController", viewID: EventsViewController.self),
            TableCellModel(title: "GET INVOLVED", image: "pic5.jpg", identifier: "GetInvolvedViewController", viewID: GetInvolvedViewController.self),
            TableCellModel(title: "GIVE", image: "pic6.jpg", identifier: "AboutUsViewController", viewID: AboutUsViewController.self),
            TableCellModel(title: "DOWNLOADS", image: "pic6.jpg", identifier: "AboutUsViewController", viewID: AboutUsViewController.self), //https://stackoverflow.com/questions/38347865/download-youtube-video-in-ios-swift
            TableCellModel(title: "ABOUT US", image: "pic6.jpg", identifier: "AboutUsViewController", viewID: AboutUsViewController.self),
            TableCellModel(title: "SETTINGS", image: "pic6.jpg", identifier: "AboutUsViewController", viewID: AboutUsViewController.self), //TODO
            
        ]
    }
    
}
