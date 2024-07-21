//
//  CreateGroupView.swift
//  miti-miti
//
//  Created by cecruzmo on 13/07/24.
//

import SwiftUI
import SwiftData

struct CreateGroupView: View {
    enum FocusedField { case none }
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State var membersName = [""]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Members")) {
                    ForEach(0 ..< membersName.count, id: \.self) { index in
                        TextField("Name", text: $membersName[index])
                            .textInputAutocapitalization(.words)
                            .disableAutocorrection(true)
                    }
                    Button("Add more members") {
                        membersName.append("")
                    }
                }
            }
            .navigationTitle("Create Group")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Create") {
                        let members = membersName.filter { !$0.isEmpty }.map { Member(name: $0) }
                        let group = ExpenseGroup(name: name, members: members)
                        context.insert(group)
                        dismiss()
                    }
                    .disabled(name.isEmpty || membersName.filter { !$0.isEmpty }.isEmpty)
                }
            }
        }
    }
}

#Preview {
    CreateGroupView()
}
