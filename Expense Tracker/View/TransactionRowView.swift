//
//  TransactionRowView.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 05/01/25.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRowView: View {
    
    var transaction: Transaction
    
    var body: some View {
        
        HStack(spacing: 20){
            
            //MARK: ICON
            RoundedRectangle(cornerRadius: 20)
                .fill(.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: .icon)
                }
            
            VStack(alignment: .leading, spacing: 6){
                //MARK: Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                    
                
                //MARK: Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                    
                
                //MARK: Date
                Text(transaction.date)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            //MARK: Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? .text : .primary)
        }
        .padding(.vertical, 8)
    }
}

struct TransactionRow_Preview: PreviewProvider{
    static var previews: some View{
        Group{
            TransactionRowView(transaction: transactionPreviewData)
            
            TransactionRowView(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
