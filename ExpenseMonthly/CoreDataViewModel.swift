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

        } catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    func addPurchase(name: String, price: String) {
        let newExpense = ExpenseEntity(context: container.viewContext)
        newExpense.name = name
        newExpense.price = price
        saveData()
    }
    
    func deletePurchase(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
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
