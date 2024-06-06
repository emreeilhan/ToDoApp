//
//  ToDoRowView.swift
//  ToDoApp
//
//  Created by Emre Ilhan on 5.06.2024.
//

import SwiftUI

struct ToDoRowView: View {
    
    var rowViewTask: Task
    
    func emoji(for priority: Priority) -> some View {
        switch priority {
        case .high:
            return Image(systemName: "figure.walk.motion.trianglebadge.exclamationmark")
                .foregroundStyle(.red)
        case .normal:
            return Image(systemName: "figure.walk.motion")
                .foregroundStyle(.orange)
        case .low:
            return Image(systemName: "figure.walk.departure")
                .foregroundStyle(.green)
                
        }
    }
    var body: some View {
        HStack{
            Button(action: {rowViewTask.isCompleted.toggle()}){
                Image(systemName: rowViewTask.isCompleted ? "checkmark.circle.fill" : "circle").foregroundStyle(.green)
            }
            VStack(alignment:.leading) {
                if rowViewTask.isCompleted == false{
                    Text(rowViewTask.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        
                } else {
                    Text(rowViewTask.title)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .strikethrough()
                    
                }
                Text(rowViewTask.date, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            emoji(for: rowViewTask.priority)
        }
    }
}

#Preview {
    ToDoRowView(rowViewTask: Task(title: "Do Homework", isCompleted: true, date: Date(), priority: .high))
}
