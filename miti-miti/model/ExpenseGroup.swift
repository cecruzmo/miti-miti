//
//  ExpenseGroup.swift
//  miti-miti
//
//  Created by cecruzmo on 13/07/24.
//

import Foundation
import SwiftData

@Model
class ExpenseGroup {
    var name: String
    var members: [Member]
    var transactions: [Transaction]
    var createdAt: Date
    
    init(name: String, members: [Member], transactions: [Transaction] = [], createdAt: Date = Date.now) {
        self.name = name
        self.members = members
        self.transactions = transactions
        self.createdAt = createdAt
    }
}
