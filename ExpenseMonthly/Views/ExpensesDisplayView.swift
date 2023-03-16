//
//  ExpensesDisplayView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI

struct ExpensesDisplayView: View {
    var body: some View {
        ZStack {
         
            LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
            VStack {
                Spacer()
                ExpensesView()
            }
        }
        .ignoresSafeArea()
    }
}

struct ExpensesDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesDisplayView()
    }
}
