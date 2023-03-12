//
//  PurchaseCategories.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-12.
//

import Foundation

class PurchaseCategories: ObservableObject {
    @Published var categories: [PurchaseCategory] = []
    
    init() {
        
    }
    
    func addPurchaseCategory(category: String) {
        let newCategory = PurchaseCategory(name: category)
        categories.append(newCategory)
    }

}
