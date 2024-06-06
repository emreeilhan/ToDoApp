//
//  CreateTaskView.swift
//  ToDoApp
//
//  Created by Emre Ilhan on 5.06.2024.
//

import SwiftUI

struct CreateTaskView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var title:String = ""
    @State var date:Date = Date()
    @State var priority:Priority = .normal
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    TextField("Your task", text: $title)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    Picker(selection: $priority, label: Text("Priority")) {
                        ForEach(Priority.allCases) { priority in
                                Text(priority.rawValue).tag(priority)
                                    
                            }
                    }
                    .pickerStyle(.automatic)
                    Section {
                        EmptyView()
                    } footer: {
                        HStack {
                            Button("Cancel") {
                                dismiss()
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .buttonBorderShape(.roundedRectangle)
                            .tint(.red)
                            Spacer(minLength: 130)
                            Button("Save", action: saveTask)
                                .buttonStyle(.bordered)
                                .controlSize(.large)
                                .buttonBorderShape(.roundedRectangle)
                                .tint(.green)
                        }.padding(.top,-25)
                    }
                    
                }
            }
            .navigationTitle("Create a task")
            
        }
    }
    
    
    private func saveTask(){
        let newTask = Task(title: title, isCompleted: false, date: date, priority: priority)
        modelContext.insert(newTask)
        dismiss()
    }
}

#Preview {
    CreateTaskView()
}
