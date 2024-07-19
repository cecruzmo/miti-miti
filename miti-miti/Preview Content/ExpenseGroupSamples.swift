//
//  ExpenseGroupSamples.swift
//  miti-miti
//
//  Created by cecruzmo on 19/07/24.
//

import Foundation
import SwiftData

extension ExpenseGroup {
    static let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!
    static let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date.now)!
    
    static var expenseGroupsSamples: [ExpenseGroup] {
        [
            ExpenseGroup(name: "Mutual Fund", createdAt: lastWeek),
            ExpenseGroup(name: "Trip to Mexico", createdAt: lastMonth)
        ]
    }
}
