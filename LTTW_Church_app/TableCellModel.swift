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
    let onClickID: String
    
    static func all() -> [TableCellModel] {
        return [
            TableCellModel(title: "MESSAGES", image: "pic1.jpg", onClickID: "MessagesViewController"),
            TableCellModel(title: "EVENTS", image: "pic2.jpg", onClickID: "EventsViewController"),
            TableCellModel(title: "BIBLE", image: "pic3.jpg", onClickID: "BibleViewController"),
            TableCellModel(title: "NOTES", image: "pic4.jpg", onClickID: "NotesViewController"),
            TableCellModel(title: "GET INVOLVED", image: "pic5.jpg", onClickID: "GetInvolvedViewController"),
            TableCellModel(title: "ABOUT US", image: "pic6.jpg", onClickID: "AboutUsViewController"),
        ]
    }
    
}
