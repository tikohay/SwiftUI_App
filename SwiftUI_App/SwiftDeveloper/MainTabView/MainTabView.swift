//
//  MainTabView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 15.04.2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tabSelected = 0
    
    var body: some View {
        TabView(selection: $tabSelected) {
            HomeView(tabSelection: $tabSelected)
                .badge(10)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("first")
                }.tag(0)
            Text("Another tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("second")
                }.tag(1)
            Text("The last tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }.tag(2)
        }
        .font(.headline)
        .accentColor(.blue)
    }
}

struct HomeView: View {
    
    @State var text: String = "hello"
    @Binding var tabSelection: Int
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(edges: .top)
            VStack(spacing: 20) {
                Text(text)
                Button {
                    text = "hey"
                } label: {
                    Text("button")
                }
                Button {
                    tabSelection = 2
                } label: {
                    Text("Перейти в корзину")
                        .font(.headline)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
