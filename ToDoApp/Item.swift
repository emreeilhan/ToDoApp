//
//  Item.swift
//  ToDoApp
//
//  Created by Emre Ilhan on 5.06.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
