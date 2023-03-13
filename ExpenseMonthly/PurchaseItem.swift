//
//  PurchaseItem.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-12.
//

import Foundation

struct PurchaseItem: Identifiable {
    var id = UUID().uuidString
    var name: String
    var amount: Double
}
