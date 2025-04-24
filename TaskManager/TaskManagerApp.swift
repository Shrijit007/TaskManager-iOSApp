//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Shrijit Raj on 12/12/24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    init(){
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
