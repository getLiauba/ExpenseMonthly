//
//  PurchaseCategory.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-12.
//

import Foundation


class PurchaseCategory: ObservableObject, Hashable {
    var name:String
    var id: String
    @Published var items: [PurchaseItem] = []
    
    init(name: String) {
        self.name = name
        self.id = UUID().uuidString
    }
    
    func addPurchaseItem(item: PurchaseItem) {
        items.append(item)
    }
    
    static func == (lhs: PurchaseCategory, rhs: PurchaseCategory) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
