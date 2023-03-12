//
//  AddView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-02-19.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var expenseName = ""
    @State private var amount = 0.0
    
    @State private var date = Date()
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Expense Name", text: $expenseName)
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                
                DatePicker("Start Date",selection: $date,displayedComponents: [.date])
                
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: self.expenseName, amount: self.amount, dueDate: self.date)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
