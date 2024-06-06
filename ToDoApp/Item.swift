//
//  Item.swift
//  ToDoApp
//
//  Created by Emre Ilhan on 5.06.2024.
//

import Foundation
import SwiftData

enum Priority: String,CaseIterable,Codable,Identifiable {
    var id: String { self.rawValue }
    
    case low = "Low"
    case normal = "Normal"
    case high = "High"
}


@Model
final class Task {
    var title: String
    var isCompleted: Bool
    var date: Date
    var priority: Priority
    
    init(title: String, isCompleted: Bool, date: Date, priority: Priority) {
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
        self.priority = priority
    }
    
    
}


//let birTask = Task(title: "Do homework", isCompleted: false, date: Date(), priority: .high)
