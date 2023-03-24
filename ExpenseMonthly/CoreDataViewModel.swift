//
//  CoreDataViewModel.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-15.
//

import CoreData
import Foundation


class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [ExpenseEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "PurchasesContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data. \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchPurchases()
    }
    
    func fetchPurchases(){
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
            sortPurchasesByDate()

        } catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    func getTrailingMonths() {
        // This function will get the past 6 months and return it into an array
    }

    
    func getTrailingMonthTotals() -> [CGFloat] {
        let calendar = Calendar.current
        var trailingMonthTotals: [CGFloat] = []
        
        for i in 0..<6 {
            guard let month = calendar.date(byAdding: .month, value: -i, to: Date()) else {
                continue
            }
            
            let purchases = savedEntities.filter {
                let purchaseMonth = calendar.component(.month, from: $0.date ?? Date.now)
                let purchaseYear = calendar.component(.year, from: $0.date ?? Date.now)
                let targetMonth = calendar.component(.month, from: month)
                let targetYear = calendar.component(.year, from: month)
                return purchaseMonth == targetMonth && purchaseYear == targetYear
            }
            
            let totalSpend = purchases.reduce(0.0) { $0 + Double($1.price!)! }
            trailingMonthTotals.append(CGFloat(totalSpend))
        }
        
        return trailingMonthTotals.reversed()
    }
    
    
    func addPurchase(name: String, price: String,date: Date) {
        let newExpense = ExpenseEntity(context: container.viewContext)
        newExpense.name = name
        newExpense.price = price
        newExpense.date = date
        saveData()
    }
    
    func deletePurchase(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deletePurchaseByDate(date: Date) {
        let purchases = savedEntities.filter { $0.date == date }
        guard let purchase = purchases.first else { return }
        container.viewContext.delete(purchase)
        saveData()
        fetchPurchases()
    }
    
    func sortPurchasesByDate() {
        savedEntities.sort { $0.date ?? Date.distantPast > $1.date ?? Date.distantPast }
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchPurchases()

        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
