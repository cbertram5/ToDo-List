//
//  ToDoItem.swift
//  ToDo List
//
//  Created by Chris Bertram on 9/23/20.
//  Copyright © 2020 Chris Bertram. All rights reserved.
//

import Foundation

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool
    var notificationID: String?
    var completed: Bool
}

