//
//  ContentView.swift
//  ToDoApp
//
//  Created by Emre Ilhan on 5.06.2024.
//

import SwiftUI
import SwiftData

struct HomePageView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort:\Task.date) private var görevler: [Task]
    @State private var isSheetShowing = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(görevler) { görev in
                    ToDoRowView(rowViewTask: görev)
                }
                .onDelete(perform:deleteItem)
            }
            .navigationTitle("Dashboard")
            .fullScreenCover(isPresented: $isSheetShowing) {
                CreateTaskView()
                    .ignoresSafeArea(.all)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Tap me", systemImage: "plus", action: {isSheetShowing = true})
                        .buttonStyle(.bordered)
                        .labelStyle(.iconOnly)
                        .controlSize(.regular)
                        .buttonBorderShape(.circle)
                        .tint(.primary)
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .foregroundStyle(.primary)
                }
            }
        }
        
    }
    private func deleteItem(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let entryToDelete = görevler[index]
                modelContext.delete(entryToDelete)
            }
        }
    }}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .modelContainer(for: Task.self, inMemory: true)
    }
}
