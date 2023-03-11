//
//  ExpenseItem.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-02-19.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let amount: Double
    var dueDate: Date

    
    var daysUntilDue: Int {
        get {
            daysBetween(start: Date.now, end: dueDate)
        }
        set {}
    }
    
    mutating func updateData(){
    
        if !(dueDate < Date.now){
            var dateComponents = DateComponents()
            dateComponents.day = 30
            
            let futureDate = Calendar.current.date(byAdding: dateComponents, to: dueDate)
            dueDate = futureDate!
        }
        daysUntilDue = daysBetween(start: Date.now, end: dueDate)
        
    }
    
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
}
