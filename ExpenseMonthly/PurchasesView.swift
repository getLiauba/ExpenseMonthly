//
//  PurchasesView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-11.
//

import SwiftUI

struct PurchasesView: View {
    
    var purchaseCategories = ["Food","Clothing","Dates","Education", "Memberships"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 180))]) {
                    ForEach(purchaseCategories, id: \.self){ label in
                        PurchaseCategory(categoryName: label)
                            .padding()
                    }
                }
            }
            .navigationTitle("Purchases")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button {
                    print("Clicked")
                } label: {
                    Image(systemName: "plus")
                }
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
