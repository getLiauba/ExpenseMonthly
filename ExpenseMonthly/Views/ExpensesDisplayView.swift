//
//  ExpensesDisplayView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI

struct ExpensesDisplayView: View {
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
                VStack {
                    Spacer()
                    ExpensesView(vm: vm)
                }
            }
            .navigationTitle("Hello Andrew")
            .ignoresSafeArea()
            
        }
    }
}

struct ExpensesDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesDisplayView()
    }
}
