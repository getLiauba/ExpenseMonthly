//
//  AddPurchaseView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-13.
//

import SwiftUI

struct AddPurchaseView: View {
    
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var expenseName = ""
    @State private var amount = 0.0
    
    @State private var date = Date()
    
    
    var body: some View {
        
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

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView(expenses: Expenses())
    }
}
