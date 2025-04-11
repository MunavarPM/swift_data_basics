//
//  AddExpenseSheet.swift
//  SwiftDataExample
//
//  Created by MUNAVAR PM on 08/04/25.
//

import SwiftUI


struct AddExpenseSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var date: Date = .now
    @State private var value = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date)
                TextField("Value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = Expense(name: name, date: date, value: value)
                        context.insert(expense) // SwiftData had autoSave 🤴🏽
    //                    try! context.save() // Not need just force and save it's save automatically
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddExpenseSheet()
}
