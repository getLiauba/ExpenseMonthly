//
//  AddExpenseNameView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI
import CoreData

struct AddExpenseNameView: View {
    
    @StateObject var vm:CoreDataViewModel
    var expensePrice:String
    @Binding var isActive: Bool

    @State var expenseName = ""
    @Binding var expenseDate:Date
    
    
//    @StateObject var vm:CoreDataViewModel
//    var expensePrice:String
//    @State var isActive: Bool
//
//    @State var expenseName = ""
//    @State var expenseDate:Date
    
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .padding()
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
                Text("Expense Name")
                    .font(.title2.bold())
                    .toolbar(.hidden)
                    .padding()
                    .padding(.trailing,105)
            }
            
            TextField("Expense Name", text: $expenseName)
                .padding()
                .background(.gray.opacity(0.2))
            
            Spacer()
            
            CalendarView(selectedDate: $expenseDate)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity,height: 55)
                    .foregroundColor(.purple)
                    .padding(.horizontal)
                
                Text("Continue")
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .onTapGesture {
                vm.addPurchase(name: expenseName, price: expensePrice, date: expenseDate)
                vm.saveData()
                isActive = false
            }
        }
    }
}

//struct AddExpenseNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddExpenseNameView(vm: CoreDataViewModel(), expensePrice: "99", isActive: true, expenseDate: Date())
//    }
//}
