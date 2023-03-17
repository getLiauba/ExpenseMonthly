//
//  GPTView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-17.
//

import SwiftUI

struct GPTView: View {
    @State private var showSecondView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("First View")
                Text(showSecondView ? "True" : "False")
                NavigationLink(destination: SecondView(isActive: $showSecondView), isActive: $showSecondView) {
                    Text("Go to Second View")
                }
            }
            .navigationBarHidden(true) // hide the navigation bar for the first view
        }
    }
}

struct SecondView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Text("Second View")
            Text(isActive ? "True" : "False")
            NavigationLink(destination: ThirdView(isActive: $isActive), label: {
                Text("Go to Third View")
            })
            Button("Dismiss and Go Back") {
                isActive = false // dismiss SecondView and go back to ContentView
            }
        }
        .navigationBarBackButtonHidden(true) // hide the back button for SecondView
    }
}

struct ThirdView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Text("Third View")
            Text(isActive ? "True" : "False")
            Button("Dismiss and Go Back") {
                isActive = false // dismiss ThirdView and SecondView and go back to ContentView
            }
        }
        .navigationBarBackButtonHidden(true) // hide the back button for ThirdView
    }
}
    
    
    
struct GPTView_Previews: PreviewProvider {
    static var previews: some View {
        GPTView()
    }
}
