//
//  LocalNotificationManager.swift
//  ToDo List
//
//  Created by Chris Bertram on 10/1/20.
//  Copyright © 2020 Chris Bertram. All rights reserved.
//

import Foundation
import UserNotifications

struct LocalNotificationManager {
    
    static func authorizeLocalNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error)
            in
            guard error == nil else {
                print("ERROR: \(error!.localizedDescription)")
                return
            }
            if granted {
                print("NICE")
            } else {
                print("WRONG")
            }
        }
    }
    static func setCalendarNotification(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
    // create content:
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badgeNumber
        
        // create trigger
        var dateCompononents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        dateCompononents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateCompononents, repeats: false)
        
        // create request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        // register request with the notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("ERROR \(error.localizedDescription) YIKES, adding notification request went wrong!")
            } else {
                print("notification scheduled \(notificationID), title: \(content.title)")
            }
        }
        return notificationID
    }
}
