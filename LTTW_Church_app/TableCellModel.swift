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
            TableCellModel(title: "MESSAGES", image: "pic1.jpg", identifier: "MessagesViewController", viewID: MessagesViewController.self),
            TableCellModel(title: "EVENTS", image: "pic2.jpg", identifier: "EventsViewController", viewID: EventsViewController.self),
            TableCellModel(title: "BIBLE", image: "pic3.jpg", identifier: "BibleViewController", viewID: BibleViewController.self),
            TableCellModel(title: "NOTES", image: "pic4.jpg", identifier: "NotesViewController", viewID: NotesViewController.self),
            TableCellModel(title: "GET INVOLVED", image: "pic5.jpg", identifier: "GetInvolvedViewController", viewID: GetInvolvedViewController.self),
            TableCellModel(title: "ABOUT US", image: "pic6.jpg", identifier: "AboutUsViewController", viewID: AboutUsViewController.self),
        ]
    }
    
}
