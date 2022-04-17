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
    @State var selector: String?
    
    let coffee = "coffee"
    let tea = "tea"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You chose \(userBuy.caps) items")
                Text("Что желаете ?")
                NavigationLink(tag: "act1", selection: $selector) {
                    DetailView(text: tea)
                } label: {
                    EmptyView()
                }
                NavigationLink(tag: "act2", selection: $selector) {
                    DetailView(text: coffee)
                } label: {
                    EmptyView()
                }
                
                Button {
                    selector = "act1"
                } label: {
                    Text("button")
                }

            }
                .navigationBarTitle("Title", displayMode: .inline)
        }
        .environmentObject(userBuy)
    }
}
