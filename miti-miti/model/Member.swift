//
//  Member.swift
//  miti-miti
//
//  Created by cecruzmo on 19/07/24.
//

import Foundation
import SwiftData

@Model
class Member {
    var id = UUID()
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
