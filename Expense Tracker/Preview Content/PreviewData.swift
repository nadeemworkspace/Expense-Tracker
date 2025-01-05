//
//  PreviewData.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import Foundation

let transactionPreviewData: Transaction = Transaction(id: 1, date: "2025-01-01", institution: "Barclays Bank", account: "Savings", merchant: "Amazon", amount: 120.50, type: TransactionType.credit.rawValue, categoryId: 1, category: "Shopping", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

let transactionPreviewDataArray = [Transaction](Array(repeating: transactionPreviewData, count: 10))


