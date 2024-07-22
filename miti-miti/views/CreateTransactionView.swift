//
//  CreateTransactionView.swift
//  miti-miti
//
//  Created by cecruzmo on 21/07/24.
//

import SwiftUI

struct CreateTransactionView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var amount = 0.0
    @State private var payee: Member?
    
    let group: ExpenseGroup
    
    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol  = ""
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Amount")) {
                    TextField("Amount", value: $amount, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Picker("Payee", selection: $payee) {
                        ForEach(group.members, id: \.self) { member in
                            Text(member.name)
                                .tag(member as Member?)
                        }
                    }
                }
                
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Create") {
                        guard let payee else { return }
                        let transaction = Transaction(title: title, amount: amount, payee: payee)
                        group.transactions.append(transaction)
                        dismiss()
                    }
                    .disabled(title.isEmpty || amount == 0.0 || payee == nil)
                }
            }
            .onAppear {
                payee = group.members.first
            }
        }
    }
}

#Preview {
    let preview = Preview(ExpenseGroup.self)
    preview.addExamples(ExpenseGroup.expenseGroupsSamples)
    return CreateTransactionView(group: ExpenseGroup.expenseGroupsSamples[0])
        .modelContainer(preview.container)
}
