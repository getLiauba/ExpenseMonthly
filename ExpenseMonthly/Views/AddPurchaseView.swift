//
//  AddPurchaseView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-13.
//

import SwiftUI

struct AddPurchaseView: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    //@ObservedObject var expenses: Expenses
    @ObservedObject var categoryPurchase: PurchaseCategory
    @Environment(\.dismiss) var dismiss
    
    @State private var expenseName = ""
    @State private var amount = 0.0
    
    @State private var date = Date()
    
    
    var body: some View {
        Section {
            Form {
                TextField("Expense Name", text: $expenseName)
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                
                DatePicker("Start Date",selection: $date,displayedComponents: [.date])
                
            }
            Button {
                vm.addPurchase(name: expenseName,price: "99",date: Date.now)
                categoryPurchase.items.append(PurchaseItem(name: expenseName, amount: amount))
                dismiss()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200,height: 50)
                    Text("SAVE")
                        .foregroundColor(.white)
                }
            }
        }
        
    }
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView(categoryPurchase: PurchaseCategory(name: "Test"))
    }
}
