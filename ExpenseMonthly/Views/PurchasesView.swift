//
//  PurchasesView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-11.
//

import SwiftUI

struct PurchasesView: View {
    
    @State var showingAddPurchaseCategory = false
    @StateObject var expenses = Expenses()
    @ObservedObject var purchaseCategories = PurchaseCategories()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 180))]) {
                    ForEach(purchaseCategories.categories, id: \.self){ category in
                        PurchaseCategoryView(category: category)
                            .padding()
                    }
                }
            }
            .navigationTitle("Purchases")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button {
                    showingAddPurchaseCategory = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddPurchaseCategory) {
                AddPurchaseCategoryView(purchaseCatergories: self.purchaseCategories)
            }
        }
        .padding(10)

    }
}

struct PurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasesView()
    }
}
