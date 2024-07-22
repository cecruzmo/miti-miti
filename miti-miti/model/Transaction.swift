//
//  Transaction.swift
//  miti-miti
//
//  Created by cecruzmo on 21/07/24.
//

import Foundation
import SwiftData

@Model
class Transaction {
    var id = UUID()
    var title: String
    var amount: Double
    var payee: Member
    var createdAt: Date
    
    init(title: String, amount: Double, payee: Member, createdAt: Date = Date.now) {
        self.title = title
        self.amount = amount
        self.payee = payee
        self.createdAt = createdAt
    }
}
