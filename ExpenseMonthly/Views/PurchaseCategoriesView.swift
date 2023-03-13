//
//  PurchaseCategoriesView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-12.
//

import SwiftUI

struct PurchaseCategoryView: View {
    
    var category: PurchaseCategory
    
    var body: some View {
        NavigationLink {
            PurchaseCategoryListView(purchaseCategory: category)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 100)
                    .foregroundColor(.blue)
                VStack {
                    Text("\(category.name)")
                        .foregroundColor(.white)
                        .font(.title2.bold())
                        .padding(.bottom,8)
                    
                    Text("$200 this month")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct PurchaseCategory_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseCategoryView(category: PurchaseCategory(name: "Test"))
    }
}
