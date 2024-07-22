//
//  GroupView.swift
//  miti-miti
//
//  Created by cecruzmo on 21/07/24.
//

import SwiftUI
import SwiftData

struct GroupView: View {
    @Environment(\.locale) private var locale
    
    let group: ExpenseGroup
    @State private var createTransaction = false
    
    var body: some View {
        NavigationStack {
            Group {
                if group.transactions.isEmpty {
                    ContentUnavailableView("No Expenses Added", systemImage: "dollarsign.gauge.chart.lefthalf.righthalf")
                } else {
                    List {
                        ForEach(group.transactions) { transaction in
                            VStack(alignment: .leading) {
                                HStack(spacing: 10) {
                                    Text(transaction.title)
                                        .font(.title2)
                                    Spacer()
                                    Text(transaction.amount.formatted(.currency(code: locale.currency?.identifier ?? "USD")))
                                        .font(.title2)
                                        .foregroundStyle(.gray)
                                }
                                Text("Paid by: \(transaction.payee.name)")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(group.name)
            .toolbar {
                Button {
                    createTransaction = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createTransaction) {
                CreateTransactionView(group: group)
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview("No Transactions") {
    let preview = Preview(ExpenseGroup.self)
    preview.addExamples(ExpenseGroup.expenseGroupsSamples)
    return GroupView(group: ExpenseGroup.expenseGroupsSamples[0])
        .modelContainer(preview.container)
}

#Preview("Group with Transactions") {
    let preview = Preview(ExpenseGroup.self)
    preview.addExamples(ExpenseGroup.expenseGroupsSamples)
    return GroupView(group: ExpenseGroup.expenseGroupsSamples[1])
        .modelContainer(preview.container)
}
