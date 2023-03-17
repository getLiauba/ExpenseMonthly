//
//  AddExpenseView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI

struct AddExpenseView: View {
    @StateObject var vm:CoreDataViewModel
    @Binding var isActive: Bool
    
    @Environment(\.dismiss) var dismiss
    var grandientColor = LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    @State var amount = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .padding()
                    .onTapGesture {
                        isActive = false
                        //dismiss()
                    }
                    Spacer()
                Text("Enter Amount")
                    .font(.title2.bold())
                    .toolbar(.hidden)
                    .padding()
                    .padding(.trailing,110)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: .infinity, height: 280)
                    .foregroundColor(.white)
                Text("$\(amount)")
                    .font(.largeTitle.bold())
                    .animation(.spring().speed(2.0))
            }
            Spacer()
            NumberPad(amount: $amount)
            
            NavigationLink {
                AddExpenseNameView(vm: vm, expensePrice: amount, isActive: $isActive)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: .infinity,height: 60)
                        .foregroundColor(.purple)
                        .padding(.horizontal)
                        
                    Text("Continue")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                }
            }
        }
    }
}


struct NumberPad: View {
    @Binding var amount: String
    var numbers = ["1","2","3","4","5","6","7","8","9",".","0","-1"]
    var body: some View {
     
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(numbers[0..<numbers.count],id: \.self) { number in
                Number(number: number)
                    .onTapGesture {
                        if number == "-1" {
                            if !amount.isEmpty {
                                amount.removeLast()
                            }
                        } else {
                            amount.append(number)
                        }
                    }
            }
        }
        
    }
}

struct Number:View {
    var number:String
    var body: some View {
     
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 17,height: 70)
            if (number == "-1"){
                Image(systemName: "delete.backward")
                    .resizable()
                    .frame(width: 35,height: 30)
            } else {
                Text("\(number)")
                    .font(.title2.bold())
            }
            
        }
    }
}

//struct AddExpenseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddExpenseView(vm: CoreDataViewModel(),isActive: $isActive)
//    }
//}
