//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by MUNAVAR PM on 06/04/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    
//    let container : ModelContainer = {
//        let schema = Schema([Expense.self])
//        let container = try! ModelContainer(for: schema, configurations: [])
//        return container
//    }() // It's pass when we need adjustment in the persistance costomization
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(container) // In case we need to pass the persistance by adjustment.
        .modelContainer(for: [Expense.self]) // Why make it has array because we if there had multiple of SwiftData tpye for example we had another model also named as Student case we need to handle like this if we had only one data base we can go with out array.
    }
}
