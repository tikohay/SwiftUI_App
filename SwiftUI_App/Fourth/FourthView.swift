//
//  FourthView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 15.04.2022.
//

import SwiftUI

class UserBuy: ObservableObject {
    @Published var caps = 0
}

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userBuy: UserBuy
    
    var text: String
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Buy \(text) \(userBuy.caps) items")
                .navigationBarItems(leading:
                                        Button("back to main") {
                    self.presentation.wrappedValue.dismiss()
                },
                                    trailing:
                                        HStack {
                    Button("-") {
                        self.userBuy.caps -= 1
                    }
                    Button("+") {
                        self.userBuy.caps += 1
                    }
                })
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            userBuy.caps = 0
        }
    }
}

struct FourthView: View {
    
    @ObservedObject var userBuy = UserBuy()
    
    let coffee = "coffee"
    let tea = "tea"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You chose \(userBuy.caps) items")
                Text("Что желаете ?")
                NavigationLink(coffee, destination: {
                    DetailView(text: coffee)
                })
                NavigationLink(tea, destination: {
                    DetailView(text: tea)
                })
            }
                .navigationBarTitle("Title", displayMode: .inline)
        }
        .environmentObject(userBuy)
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
