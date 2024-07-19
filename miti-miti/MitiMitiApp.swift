//
//  miti_mitiApp.swift
//  miti-miti
//
//  Created by cecruzmo on 2/07/24.
//

import SwiftUI
import SwiftData

@main
struct MitiMitiApp: App {
    let container: ModelContainer
    
    init() {
        let schema = Schema([ExpenseGroup.self])
        let config = ModelConfiguration("MitiMiti", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
    
    var body: some Scene {
        WindowGroup {
            GroupsView()
        }
        .modelContainer(container)
    }
}
