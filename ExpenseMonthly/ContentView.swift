//
//  ContentView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-02-19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var components = DateComponents()
    
    var body: some View {
        
        
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                        .padding(1)
                        Text("Due in \(item.daysUntilDue) day(s)")
                            .font(.footnote.bold())
                            .foregroundColor(.red)
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Monthly Expenses")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func getDate() -> Date{
        var components = DateComponents()
        components.day = 19
        components.month = 3
        let date = Calendar.current.date(from: components)
        
        return date!
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
