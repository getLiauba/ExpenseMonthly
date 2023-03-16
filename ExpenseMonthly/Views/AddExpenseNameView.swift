//
//  AddExpenseNameView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI

struct AddExpenseNameView: View {
    
    var expensePrice:String
    @State var expenseName = ""
    @Environment(\.dismiss) var dismiss
    
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

            
            Spacer()
            
            NavigationLink {
                ExpensesDisplayView()
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

struct AddExpenseNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseNameView(expensePrice: "40")
    }
}
