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
                        let total = group.transactions.sum(\.amount)
                        Section {
                            HStack(spacing: 10) {
                                Text("Total")
                                    .font(.title2)
                                Spacer()
                                Text((total).formatted(.currency(code: locale.currency?.identifier ?? "USD")))
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                            }
                        }
                        Section(header: Text("Members")) {
                            let totalPerMember: Double = total / Double(group.members.count)
                            ForEach(group.members) { member in
                                let amount = group.transactions.filter { $0.payee == member }.sum(\.amount)
                                HStack(spacing: 10) {
                                    Text(member.name)
                                        .font(.title2)
                                    Spacer()
                                    Text((amount - totalPerMember).formatted(.currency(code: locale.currency?.identifier ?? "USD")))
                                        .font(.title2)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        Section(header: Text("Expenses")) {
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
                    }
                    .listStyle(.insetGrouped)
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
            .background(Color(uiColor: UIColor.systemGray6))
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
