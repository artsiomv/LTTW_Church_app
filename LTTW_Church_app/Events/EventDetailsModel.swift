//
//  MessageDetailsModel.swift
//  LTTW_Church_app
//
//  Created by Artiom on 2/13/19.
//  Copyright © 2019 Artiom. All rights reserved.
//
//import XCDYouTubeKit
import UIKit
import WebKit
import EventKit
//import EventKitUI


class EventDetailsModel: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myBigTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedEvent : EventInfoModel?
    var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]


    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.target = self
        backButton.action = #selector(actionClose)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let imageURLString = "https://app.lttwchurch.org/uploads/" + (selectedEvent?.imageName!)!
        let url = URL(string: imageURLString)
        myImage.load(url: url!)
        
        myBigTitle.title = selectedEvent!.title
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) as! CellModel1
        if indexPath.row == 0 {
            cell.typeLabel.text = "Description"
            cell.myText.text = selectedEvent?.eventDescription
        } else if indexPath.row == 1 {
            cell.typeLabel.text = "Save Event"
            
            let s = selectedEvent!.startDate?.month
            let str = month[s!-1] + " " + (selectedEvent!.startDate?.day?.description)!
            let t = selectedEvent!.endDate?.month
            let str2 = month[t!-1] + " " + (selectedEvent!.endDate?.day?.description)!
            let str3 = (selectedEvent!.startTime?.description)!
            
            if str != str2  {
                cell.myText.text = str + " - " + str2 + "\n" + str3
            } else {
                cell.myText.text = str  + " " + str3
            }
            cell.myImage.image = UIImage(named:"icons8-calendar-11-filled-30")!
        } else if indexPath.row == 2 {
            cell.typeLabel.text = "Directions"
            cell.myText.text = selectedEvent!.address!
            cell.myImage.image = UIImage(named:"icons8-map-30")!
        }
       return cell
        
    }
    
    //handle onTap events for each row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        if indexPath.row == 1 {
            let eventStore : EKEventStore = EKEventStore()

            // 'EKEntityTypeReminder' or 'EKEntityTypeEvent'

            eventStore.requestAccess(to: .event) { (granted, error) in
                if (granted) && (error == nil) {
                    print("granted \(granted)")
                    print("error \(String(describing: error))")
                    
                    let event:EKEvent = EKEvent(eventStore: eventStore)
                    event.title = self.selectedEvent!.title
                    event.startDate = Calendar.current.date(from: self.selectedEvent!.startDate!)!
                    event.endDate = Calendar.current.date(from: self.selectedEvent!.endDate!)!
                    event.notes = self.selectedEvent!.eventDescription
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    
                    do {
                        try eventStore.save(event, span: .thisEvent)
                        print("Saved Event")
                        let alert = UIAlertController(title: "Success", message: "Event has been added to your calendar.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    } catch let error as NSError {
                        print("failed to save event with error : \(error)")
                        let alert = UIAlertController(title: "Failed", message: "Something went wrong.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                }
                else{
                    print("failed to save event with error : \(String(describing: error)) or access not granted")
                }
            }
        } else if indexPath.row == 2 {
            let str = "https://www.google.com/maps/place/" + (selectedEvent?.address!)!
            let urlStr : String = str.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            let url = URL(string: urlStr)
            UIApplication.shared.open(url!)
        }
    }
    //what happens when user clicks back button
    @objc func actionClose(_ tap: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
