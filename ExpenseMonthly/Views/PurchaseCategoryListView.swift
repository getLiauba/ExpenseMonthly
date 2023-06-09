//
//  PurchaseCategoryListView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-13.
//

import SwiftUI

struct PurchaseCategoryListView: View {
    
    @State var showingAddPurchase = false
    
    var purchaseCategory: PurchaseCategory
    @StateObject var vm = CoreDataViewModel()

    
    var body: some View {
            List {
                
                ForEach(vm.savedEntities){ entity in
                    Text(entity.name ?? "No Name")
                }
                
//                ForEach(purchaseCategory.items) { item in
//                    VStack {
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(item.name)
//                                    .font(.headline)
//                            }
//                            Spacer()
//                            Text(item.amount, format: .currency(code: "USD"))
//                        }
//                        .padding(1)
//                    }
//                }
            }
            .navigationTitle("Monthly Expenses")
            .toolbar {
                Button {
                    showingAddPurchase = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddPurchase) {
                AddPurchaseView(categoryPurchase: purchaseCategory)
            }
        

    }
}

struct PurchaseCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseCategoryListView(purchaseCategory: PurchaseCategory(name: "Test"))
    }
}
