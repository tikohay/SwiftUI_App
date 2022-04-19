//
//  MenuView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 19.04.2022.
//

import SwiftUI

struct MenuView: View {
    
    @State var index = 0
    @State var show = false

    var body: some View {
        ZStack {
            HStack {
                VStack() {
                    Image("nike1")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    Text("Hy")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    Text("John")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Button {
                        self.index = 0
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "person")
                            Text("catalogue")
                        }.padding(.vertical, 10)
                            .background(.yellow)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        self.index = 1
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "person")
                            Text("Basket")
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(.yellow)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        self.index = 2
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "person")
                            Text("Orders")
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(.yellow)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        self.index = 2
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "person")
                            Text("Orders")
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(.yellow)
                            .cornerRadius(10)
                    }
                    Divider().frame(width: 150, height: 1)
                        .padding(.vertical, 30)
                    
                    Button {
                        print("hello")
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text("close")
                        } .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                Spacer(minLength: 0)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: show ? "xmark" : "line.horizontal.3")
                    }

                }
            }
        }
    }
}
