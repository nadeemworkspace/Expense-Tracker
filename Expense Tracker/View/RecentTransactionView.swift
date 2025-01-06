//
//  RecentTransactionView.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import SwiftUI

struct RecentTransactionView: View {
    
    @EnvironmentObject var viewModel: TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Recent Transactions")
                    .font(.subheadline)
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    TransactionListView()
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.text)
                }

            }
            .padding(.top)
            
            //MARK: Transactions
            ForEach(Array(viewModel.transactions.enumerated().prefix(5)), id: \.element) { index, transaction in
                TransactionRowView(transaction: transaction)
                if index != 4{
                    Divider()
                }
            }

        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    let vm: TransactionListViewModel = {
        let vm = TransactionListViewModel()
        vm.transactions = transactionPreviewDataArray
        return vm
    }()
    RecentTransactionView()
        .environmentObject(vm)
        .padding()
}
