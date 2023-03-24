//
//  ExpenseDetailsView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-24.
//

import SwiftUI

struct ExpenseDetailsView: View {
    
    
    @Binding var name: String
    let date: Date
    @Binding var price: String
    @StateObject var vm: CoreDataViewModel
    let id: String
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            TextField("    Expense Name", text: $name)
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .padding(.bottom)
                .padding(.horizontal)
            TextField("     Expense Price", text: $price)
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .padding(.bottom)
                .padding(.horizontal)
                
            CalendarView()
    
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity,height: 50)
                    .foregroundColor(.purple)
                    .padding(.horizontal)
                    .onTapGesture {
                        dismiss()
                        vm.updatePurchase(id: id, name: $name.wrappedValue, price: $price.wrappedValue, date: date)
                    }
                
                Text("Save")
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding(.top,30)

        }
        .toolbar {
            Image(systemName: "trash.slash")
                .foregroundColor(.red)
                .onTapGesture {
                    vm.deletePurchaseById(id: self.id)
                }
        }
        .navigationTitle(self.name)
        .onDisappear {
            vm.fetchPurchases()
        }
    }
}

//struct ExpenseDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ExpenseDetailsView(name: "Test", date: Date.now, price: "24.99",vm: CoreDataViewModel(),id: UUID().uuidString)
//        }
//    }
//}
