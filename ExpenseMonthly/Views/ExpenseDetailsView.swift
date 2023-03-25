//
//  ExpenseDetailsView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-24.
//

import SwiftUI

struct ExpenseDetailsView: View {
    
    
    @Binding var name: String
    @State var date: Date
    @Binding var price: String
    @StateObject var vm: CoreDataViewModel
    let id: String
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            TextField("Expense Name", text: $name)
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .padding(.bottom)
                .padding(.horizontal)
            
            
            TextField("Expense Price", text: $price)
              .frame(height: 50)
              .background(Color.gray.opacity(0.1))
              .padding(.bottom)
              .padding(.horizontal)
                
            CalendarView(selectedDate: $date)
    
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity,height: 50)
                    .foregroundColor(.purple)
                    .padding(.horizontal)
                    .onTapGesture {
                        let filteredPrice = removeLetters(from: price)
                        vm.updatePurchase(id: id, name: $name.wrappedValue, price: filteredPrice, date: date)
                        dismiss() // dismiss the view after saving changes
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

func removeLetters(from string: String) -> String {
    let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
    let filtered = string.filter { allowedCharacterSet.contains(UnicodeScalar(String($0))!) }
    return filtered
}

//struct ExpenseDetailsView_Previews: PreviewProvider {
//    @Binding var price: String = "100"
//    static var previews: some View {
//        NavigationView {
//            ExpenseDetailsView(name: "Test", date: Date.now, price: "24.99",vm: CoreDataViewModel(),id: UUID().uuidString)
//        }
//    }
//}
