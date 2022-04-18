//
//  CustomTabBar.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 18.04.2022.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @State private var selected = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Button {
                        self.selected = 0
                    } label: {
                        Image(systemName: "house")
                    } .foregroundColor(self.selected == 0 ? .black : .gray)
                    
                    Spacer(minLength: 15)
                    
                    Button {
                        self.selected = 1
                    } label: {
                        Image(systemName: "magnifyingglass")
                    } .foregroundColor(self.selected == 1 ? .black : .blue)
                    
                    Spacer().frame(width: 120)
                    
                    Button {
                        self.selected = 2
                    } label: {
                        Image(systemName: "person")
                    } .foregroundColor(self.selected == 2 ? .black : .blue)
                    
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 3
                    } label: {
                        Image(systemName: "book")
                    } .foregroundColor(self.selected == 3 ? .black : .blue)
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedShape())
                
                Button {
                    print("hello")
                } label: {
                    Image(systemName: "heart")
                        .renderingMode(.original)
                        .padding(18)
                } .background(.yellow)
                    .clipShape(Circle())
                    .offset(y: -32)
            }
        } .background(.blue)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CurvedShape: View {
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 55), radius: 30, startAngle: .init(degrees: 0), endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 55))
        } .fill(.green)
            .rotationEffect(.init(degrees: 180))
    }
}
