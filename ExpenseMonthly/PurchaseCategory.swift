//
//  PurchaseCategory.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-11.
//

import SwiftUI

struct PurchaseCategory: View {
    
    var categoryName: String
    
    var body: some View {
        NavigationLink {
            Text("Hello \(categoryName)")
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 175, height: 100)
                    .foregroundColor(.blue)
                VStack {
                    Text(categoryName)
                        .foregroundColor(.white)
                        .font(.title2.bold())
                        .padding(.bottom,8)
                    
                    Text("$200 this month")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                }
                    
            }
        }


        
            
            
    }
}

struct PurchaseCategory_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseCategory(categoryName: "Dinners")
    }
}
