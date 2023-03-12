//
//  AddPurchaseCategoryView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-12.
//

import SwiftUI

struct AddPurchaseCategoryView: View {
    
    var purchaseCatergories:PurchaseCategories
    @Environment(\.dismiss) var dismiss
    @State var purchaseCategory = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Category", text: $purchaseCategory)
                
            }
            .navigationTitle("Add New Category")
            .toolbar {
                Button("Save"){
                    purchaseCatergories.addPurchaseCategory(category: purchaseCategory)
                    dismiss()
                }
            }
        }
    }
}

struct AddPurchaseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseCategoryView(purchaseCatergories: PurchaseCategories())
    }
}
