//
//  TransactionSamples.swift
//  miti-miti
//
//  Created by cecruzmo on 21/07/24.
//

import Foundation

extension Transaction {
    static var transactionsSamples: [Transaction] {
        [
            Transaction(title: "Movie 🍿", amount: 123456.78, payee: Member.membersSamples[0]),
            Transaction(title: "Parking", amount: 5000.00, payee: Member.membersSamples[1])
        ]
    }
}
