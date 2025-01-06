//
//  TransactionListViewModel.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import Foundation
import Combine

typealias TransactionGroup = [String: [Transaction]]

final class TransactionListViewModel: ObservableObject{
    
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getTransactions()
    }
    
    private func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print("Error fetching transactions: ", error.localizedDescription)
                case .finished:
                    print("Finished!")
                }
            } receiveValue: { [weak self] transactions in
                print(transactions.first!)
                self?.transactions = transactions
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        return TransactionGroup(grouping: transactions, by: { $0.month })
    }
    
}
