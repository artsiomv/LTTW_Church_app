//  ViewController.swift
//  SwiftExample
//
//  Created by Belal Khan on 18/11/17.
//  Copyright © 2017 Belal Khan. All rights reserved.
//

import UIKit
import SQLite3

class SQLiteDBManager: UIViewController{
    
    var db: OpaquePointer?
    
    @IBOutlet weak var tableViewHeroes: UITableView!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPowerRanking: UITextField!
    
    @IBAction func buttonSave(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //the database file
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("HeroesDatabase.sqlite")
//        
//        //opening the database
//        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//            print("error opening database")
//        }
//        
//        //creating table
//        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Heroes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, image BLOB, speaker TEXT, date DATE)", nil, nil, nil) != SQLITE_OK {
//            
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error creating table: \(errmsg)")
//        }
        
        //getting values from textfields
        

        //validating that values are not empty

        //creating a statement
//        var stmt: OpaquePointer?
        
        //the insert query
//        let queryString = "INSERT INTO Heroes (title, videoName, image, speaker, date) VALUES (?,?,?,?,?)"
//
//        //preparing the query
//        if sqlite3_prepare(db, queryString, -1, &db, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error preparing insert: \(errmsg)")
//            return
//        }
        
//        //binding the parameters
//        if sqlite3_bind_text(db, 1, title, -1, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure binding title: \(errmsg)")
//            return
//        }
//
//        if sqlite3_bind_int(db, 2, (powerRanking! as NSString).intValue) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure binding name: \(errmsg)")
//            return
//        }
        
//        //executing the query to insert values
//        if sqlite3_step(db) != SQLITE_DONE {
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure inserting hero: \(errmsg)")
//            return
//        }
        
        
        
        
        
        //preparing the query

        //binding the parameters

        //executing the query to insert values
        
    }
}
