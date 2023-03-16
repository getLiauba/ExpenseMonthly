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
    @Published var savedEntities: [PurchaseEntity] = []
    
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
        let request = NSFetchRequest<PurchaseEntity>(entityName: "PurchaseEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)

        } catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    func addPurchase(name: String) {
        let newPurchase = PurchaseEntity(context: container.viewContext)
        newPurchase.name = name
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
