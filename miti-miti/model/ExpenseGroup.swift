//
//  ExpenseGroup.swift
//  miti-miti
//
//  Created by cecruzmo on 13/07/24.
//

import SwiftUI
import SwiftData

@Model
class ExpenseGroup {
    var name: String
    var createdAt: Date
    
    init(name: String, createdAt: Date = Date.now) {
        self.name = name
        self.createdAt = createdAt
    }
}
