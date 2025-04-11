//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by MUNAVAR PM on 06/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var isShowingItemSheet = false
    // @Query(filter: #Predicate<Expense> { $0.value > 1000 }, sort: \Expense.date) var expense: [Expense] 
    @Query(sort: \Expense.date) var expense: [Expense] // For fetching so we give the Sort it's pass the data like sorted by the date.
    @State private var isUpdateSheet: Expense?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expense) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            isUpdateSheet = expense
                        }
                }
                .onDelete { IndexSet in
                    for index in IndexSet {
                        context.delete(expense[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) {
                AddExpenseSheet()
            }
            .sheet(item: $isUpdateSheet) { expense in
                UpdateExpenseSheet(expense: expense)
            }
            .toolbar {
                if !expense.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expense.isEmpty {
                    ContentUnavailableView {
                        Label(
                            "No Expense",
                            systemImage: "list.bullet.rectangle.portrait"
                        )
                    } description: {
                        Text("Start adding expense to see your list")
                    } actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    }
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
