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
        ZStack () {
            //grandientColor
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
                                .frame(width: 150,height: 35)
                                
                            Text("Add Expense")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing)
                }
                .padding(.leading,25)
                .padding(.top)
                
                
                ScrollView {
                    ForEach(vm.savedEntities) { entity in
                        Expense(expenseName: entity.name!, expenseDate: "19", expensePrice: entity.price!, expenseDate2: entity.date ?? Date.now, vm: self.vm, id: entity.id ?? "")
                            .foregroundColor(.black)
                    }
                    .onDelete(perform: vm.deletePurchase)
                }
                .padding(.leading)
            }

        }
        .frame(width: .infinity, height: 360)
        //.ignoresSafeArea()
    }
    
}

struct MiniDate: View {
    let date: Date
    let components = Calendar.current.dateComponents([.month,.day], from: Date.now)
    var body: some View {
        VStack {
            Text(date,format: .dateTime.month())
                .font(.callout)
                .foregroundColor(.gray)
            Text(date,format: .dateTime.day())
                .font(.headline)
                .fontWeight(.heavy)
        }
    }
}


struct Expense: View {
    
    @State var expenseName:String
    @State var expenseDate:String
    @State var expensePrice:String
    @State var expenseDate2:Date
    @StateObject var vm:CoreDataViewModel
    @State var id:String
    
    var body: some View {
        NavigationLink(destination: ExpenseDetailsView(name: $expenseName, date: expenseDate2, price: $expensePrice,vm: self.vm,id: id)) {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 375,height: 55)
                        .foregroundColor(.white)
                        .padding(4)
                    HStack {
                        MiniDate(date: expenseDate2)
                        Spacer()
                        VStack {
                            Text(expenseName)
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top,10)
                        }
                        Spacer()
                        Text("$\(expensePrice)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.trailing)
                    }
                    .padding(10)

                }
                RoundedRectangle(cornerRadius: 1)
                    .frame(width: .infinity,height: 1)
                    .foregroundColor(.gray.opacity(0.3))
            }
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView(vm: CoreDataViewModel())
    }
}
