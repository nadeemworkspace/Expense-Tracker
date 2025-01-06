//
//  Untitled.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import Foundation
import SwiftUI

extension DateFormatter {
    
    static let transactionDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    static let transactionMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    
}

extension Color{
    static let systemBackground = Color(uiColor: .systemBackground)
}
