//
//  UpdateExpenseSheet.swift
//  SwiftDataExample
//
//  Created by MUNAVAR PM on 11/04/25.
//

import SwiftUI

struct UpdateExpenseSheet: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable  var expense: Expense
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date)
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}


