//
//  GroupsView.swift
//  miti-miti
//
//  Created by cecruzmo on 2/07/24.
//

import SwiftUI
import SwiftData

struct GroupsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \ExpenseGroup.name) private var groups: [ExpenseGroup]
    @State private var createGroup = false
    
    var body: some View {
        NavigationStack {
            Group {
                if groups.isEmpty {
                    ContentUnavailableView("Create new group", systemImage: "person.3")
                } else {
                    List {
                        ForEach(groups) { group in
                            NavigationLink {
                                
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(group.name).font(.title2)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("My Groups")
            .toolbar {
                Button {
                    createGroup = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createGroup) {
                CreateGroupView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview("No Groups") {
    GroupsView()
}

#Preview("Groups") {
    let preview = Preview(ExpenseGroup.self)
    preview.addExamples(ExpenseGroup.expenseGroupsSamples)
    return GroupsView()
        .modelContainer(preview.container)
}
