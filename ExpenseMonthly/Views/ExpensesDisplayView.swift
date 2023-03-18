//
//  ExpensesDisplayView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-16.
//

import SwiftUI

struct ExpensesDisplayView: View {
    @StateObject var vm = CoreDataViewModel()
    @State var barHeights: [CGFloat] = [20.0, 50.0, 75.0, 120.0, 175.0, 200.0]
    
    var body: some View {
        NavigationView{
            
            ZStack {
                VStack{
                    Spacer()
                    GeometryReader { geo in
                        GraphView(vm: vm, barHeights: barHeights)
                            .frame(width: .infinity, height: geo.size.height * 1.0)
                    }
                    ExpensesView(vm: vm)
                }
            }
            .navigationTitle("Hello Andrew")
            .ignoresSafeArea()
            .background(LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading))
            
        }
        .onAppear(){

        }
    }
}
struct ExpensesDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesDisplayView()
    }
}
