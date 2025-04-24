//
//  Task.swift
//  TaskManager
//
//  Created by Shrijit Raj on 12/12/24.
//

import Foundation

struct Task: Identifiable {
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
