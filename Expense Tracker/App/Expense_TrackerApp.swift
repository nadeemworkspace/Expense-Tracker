//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 04/01/25.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    
    @StateObject private var viewModel = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
            }
            .tint(.primary)
            .environmentObject(viewModel)
        }
    }
}
