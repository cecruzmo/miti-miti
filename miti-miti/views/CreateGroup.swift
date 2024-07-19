//
//  CreateGroup.swift
//  miti-miti
//
//  Created by cecruzmo on 13/07/24.
//

import SwiftUI

struct CreateGroup: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)
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
                                let group = ExpenseGroup(name: name)
                                context.insert(group)
                                dismiss()
                            }
                            .disabled(name.isEmpty)
                        }
                    }
            }
        }
    }
}

#Preview {
    CreateGroup()
}
