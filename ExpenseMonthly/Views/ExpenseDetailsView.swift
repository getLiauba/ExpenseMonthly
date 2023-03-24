//
//  ExpenseDetailsView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-24.
//

import SwiftUI

struct ExpenseDetailsView: View {
    
    @State var name: String
    
    let date: Date
    @State var price: String
    @State var expenseName = ""
    @StateObject var vm:CoreDataViewModel
    
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
                
                Text("Save")
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding(.top,30)
            .onTapGesture {

            }
        }
        .toolbar {
            Image(systemName: "trash.slash")
                .foregroundColor(.red)
                .onTapGesture {
                    vm.deletePurchaseByDate(date: self.date)
                }
        }
        .navigationTitle(self.name)
    }
}

struct ExpenseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExpenseDetailsView(name: "Test", date: Date.now, price: "24.99",vm: CoreDataViewModel())
        }
    }
}
