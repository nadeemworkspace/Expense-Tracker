//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 04/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: TransactionListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24){
                Text("Overview")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.primary)
                
                //MARK: Transactions
                RecentTransactionView()
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .background(Color.background)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "bell.badge")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.icon, .primary)
            }
        }
    }
    
}

#Preview {
    NavigationStack{
        HomeView()
            .environmentObject(TransactionListViewModel())
    }
}
