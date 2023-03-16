//
//  ExpenseMonthlyApp.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-02-19.
//

import SwiftUI

@main
struct ExpenseMonthlyApp: App {
    var body: some Scene {
        WindowGroup {
            PurchasesView()
            //ContentView()
            //AddPurchaseView(categoryPurchase: PurchaseCategory(name: "Test"))
        }
    }
}
