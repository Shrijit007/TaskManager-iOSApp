//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by Shrijit Raj on 12/12/24.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    //Sample Tasks
    @Published var storedTasks: [Task] = [
        // A task for today
        Task(taskTitle: "Project Discussion",
             taskDescription: "Discuss group project deliverables with teammates",
             taskDate: Date()),

        // A task for 2 hours before current time
        Task(taskTitle: "Grab Lunch",
             taskDescription: "Lunch break at the cafeteria",
             taskDate: Calendar.current.date(byAdding: .hour, value: -2, to: Date())!),

        // A task for 3 hours after current time
        Task(taskTitle: "Update Notes",
             taskDescription: "Catch up with the notes from the last lecture",
             taskDate: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!),

        // A task for 6 hours after current time
        Task(taskTitle: "Finish Lab Work",
             taskDescription: "Complete pending work for Physics lab",
             taskDate: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!),

        // A task for tomorrow
        Task(taskTitle: "Gym Workout",
             taskDescription: "Leg day workout session",
             taskDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),

        // A task for two days ago
        Task(taskTitle: "Clean Room",
             taskDescription: "Organize study space and do laundry",
             taskDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!),

        // A task for three days from today
        Task(taskTitle: "Prepare Presentation",
             taskDescription: "Work on slides for CSW project",
             taskDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
    ]


    //   Current Week Days
    @Published var currentWeek: [Date] = []
    
    //   Current Day
    @Published var currentDay: Date = Date()
    
    //   Filltering Today's Tasks
    @Published var filteredTasks: [Task]?
    
    //   Initializing
    init() {
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    //   Filter Today's Tasks
    func filterTodayTasks() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            
            let filtered = self.storedTasks.filter {
                return calendar.isDate($0.taskDate, inSameDayAs: self.currentDay)
            }
                .sorted { task1, task2 in
                    return task2.taskDate < task1.taskDate
                }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredTasks = filtered
                }
            }
        }
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    //   Extracting Date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    //   Checking if current Date is Today
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    //   Checking if the currentHour is task Hour
    func isCurrentHour(date: Date) -> Bool {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
    }
}
