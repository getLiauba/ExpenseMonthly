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
                    ForEach(0..<6) { index in
                        GraphBar(barHeight: $barHeights[index], month: getMonthLabel(5 - index),maxHeight: getMaxHeight(barHeights: barHeights), minHeight: getMinHeight(barHeights: barHeights))
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
    
    func getMaxHeight(barHeights: [CGFloat]) -> CGFloat {
        
        let barHeights = barHeights.sorted()
        return barHeights[barHeights.count-1]
    }
    
    func getMinHeight(barHeights: [CGFloat]) -> CGFloat {
        
        let barHeights = barHeights.sorted()
        return barHeights[0]
    }
    
    
    func getMonthLabel(_ index: Int) -> String {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .month, value: -index, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
}

struct GraphBar: View {
    
    @Binding var barHeight: CGFloat
    @State var barHeightStart = 0.0
    var month: String
    @State var maxHeight: CGFloat
    @State var minHeight: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack {
                    Text("$\(Int(barHeight))")
                        .font(.caption)
                        .fontWeight(.heavy)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: barHeightStart)
                        //.padding()
                        .foregroundColor(.green)
                        .opacity(0.6)
                        .onAppear() {
                            withAnimation(.linear(duration: 1.0)) {
                                barHeightStart = barHeight
                            }
                        }
                    Text(month)
                        .font(.caption)
                        .fontWeight(.heavy)
                }
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
