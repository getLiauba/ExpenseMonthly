//
//  GraphView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-18.
//

import SwiftUI

struct GraphView: View {
    
    @StateObject var vm: CoreDataViewModel
    @State var barHeights: [CGFloat]
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    ForEach(barHeights.indices) { index in
                        GraphBar(barHeight: $barHeights[index])
                    }
                }
                .padding(.leading)
                Spacer()
            }
            .ignoresSafeArea()
        }
        .onAppear() {
            barHeights = vm.getTrailingMonthTotals()
        }
    }
}

struct GraphBar: View {
    
    @Binding var barHeight: CGFloat
    @State var barHeightStart = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("$\(Int(barHeight))")
                    .font(.caption)
                    .fontWeight(.heavy)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 20, height: barHeightStart)
                    .padding()
                    .foregroundColor(.green)
                    .opacity(0.6)
                    .onAppear() {
                        withAnimation(.linear(duration: 0.75)) {
                            barHeightStart = barHeight
                        }
                    }
                Text("Mar")
                    .font(.caption)
                    .fontWeight(.heavy)
            }
        }
    }
}


struct GraphView_Previews: PreviewProvider {
    static var barHeights: [CGFloat] = [20, 50, 75, 120, 175, 200]
    static var previews: some View {
        GraphView(vm: CoreDataViewModel(), barHeights: barHeights)
    }
}
