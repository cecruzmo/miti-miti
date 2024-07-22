//
//  ExpenseGroupSamples.swift
//  miti-miti
//
//  Created by cecruzmo on 19/07/24.
//

import Foundation

extension ExpenseGroup {
    static let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!
    static let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date.now)!
    
    static var expenseGroupsSamples: [ExpenseGroup] {
        [
            ExpenseGroup(name: "Trip to Mexico 🇲🇽", members: Member.membersSamples, createdAt: lastMonth),
            ExpenseGroup(name: "Mutual Fund", members: Member.membersSamples, transactions: Transaction.transactionsSamples, createdAt: lastWeek)
        ]
    }
}
