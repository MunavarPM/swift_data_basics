//
//  Expense.swift
//  SwiftDataExample
//
//  Created by MUNAVAR PM on 06/04/25.
//

import Foundation
import SwiftData

@Model // Peoples call it's the power house of swiftData
class Expense {
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
