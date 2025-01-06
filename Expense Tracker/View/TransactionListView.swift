//
//  TransactionListView.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject private var viewModel: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(Array(viewModel.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                            TransactionRowView(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        TransactionListView()
            .environmentObject(TransactionListViewModel())
    }
}
