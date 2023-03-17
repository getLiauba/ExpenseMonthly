//
//  ExpensesView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI

struct ExpensesView: View {
    @State private var showSecondView = false
    @StateObject var vm:CoreDataViewModel
    @FetchRequest(entity: ExpenseEntity.entity(), sortDescriptors: []) var savedEntities: FetchedResults<ExpenseEntity>

    @State private var isAddExpensePresented = false
    
    var grandientColor = LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    var body: some View {
        //Spacer()
        
        ZStack () {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Text("This month")
                        .font(.title3.bold())

                    Spacer()
                    NavigationLink(destination: AddExpenseView(vm: vm, isActive: $showSecondView),isActive: $showSecondView) {
                        ZStack {
                            Color.purple
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame(width: 130,height: 35)
                                
                            Text("Add Expense")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.trailing)
                }
                .padding(.leading,25)
                .padding(.top)
                    
                    .padding(.top)
                ScrollView {
                    ForEach(vm.savedEntities) { entity in
                        Expense(expenseName: entity.name!, expenseDate: "19", expensePrice: entity.price!)
                    }
                    .onDelete(perform: vm.deletePurchase)
//                    Expense(expenseName: "Netflix", expenseDate: "16", expensePrice: "15.99")
//                    Expense(expenseName: "Apple Music", expenseDate: "10", expensePrice: "4.99")
//                    Expense(expenseName: "Spotify", expenseDate: "10", expensePrice: "9.99")
//                    Expense(expenseName: "Phone Bill", expenseDate: "18", expensePrice: "50.99")
//                    Expense(expenseName: "Netflix", expenseDate: "16", expensePrice: "15.99")
//                    Expense(expenseName: "Netflix", expenseDate: "16", expensePrice: "15.99")

                }
                .padding(.leading)
            }

        }
        .frame(width: .infinity, height: 370)
        .ignoresSafeArea()
//        .sheet(isPresented: $isAddExpensePresented) {
//            AddExpenseView()
//        }
    }
}

struct Expense: View {
    
    @State var expenseName:String
    @State var expenseDate:String
    @State var expensePrice:String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 1)
                    .frame(width: 375,height: 55)
                    .foregroundColor(.white)
                    .padding(4)
                HStack {
                    Text(expenseDate)
                        .font(.subheadline.bold())
                    Spacer()
                    Text(expenseName)
                        .font(.subheadline.bold())
                    Spacer()
                    Text(expensePrice)
                        .font(.subheadline.bold())
                }
                .padding(30)

            }
            RoundedRectangle(cornerRadius: 1)
                .frame(width: .infinity,height: 1)
                .foregroundColor(.gray)
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView(vm: CoreDataViewModel())
    }
}
