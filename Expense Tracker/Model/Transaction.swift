//
//  TransactionModel.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Codable, Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var signedAmount: Double{
        type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var icon: FontAwesomeCode{
        if let category = Category.all.first(where: { $0.id == categoryId }){
            return category.icon
        }
        return .question
    }
    
    var month: String{
        guard let transactionDate = DateFormatter.transactionDateFormatter.date(from: date) else {
            return "Unknown"
        }
        return DateFormatter.transactionMonthFormatter.string(from: transactionDate)
    }
    
}

enum TransactionType: String{
    case credit, debit
}
