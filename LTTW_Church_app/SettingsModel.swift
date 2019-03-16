//
//  TableCellModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/10/19.
//  Copyright © 2019 Artiom. All rights reserved.
//

struct SettingsModel {
    
    let title: String
    let image: String
    let imageRight: String
    
    static func all() -> [SettingsModel] {
        return [
            SettingsModel(title: "Notifications", image: "notifications", imageRight: "rightArrowWhite"),
            SettingsModel(title: "Do Not Disturb", image: "do-not-disturb", imageRight: "rightArrowWhite"),
            SettingsModel(title: "About", image: "about", imageRight: "rightArrowWhite")
        ]
    }
    
}
