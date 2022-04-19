//
//  TestView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 19.04.2022.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        ZStack {
            Color(UIColor.red.cgColor)
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Rectangle().frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    HStack(alignment: .top, spacing: 1) {
                        Rectangle().frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                        VStack(spacing: 1) {
                            ZStack(alignment: .top) {
                                Rectangle().frame(width: 100, height: 100)
                                    .foregroundColor(.yellow)
                                VStack(alignment: .leading) {
                                    HStack() {
                                        Text("hello")
                                        Text("hey")
                                        Spacer()
                                    } .padding([.top, .leading], 5)
                                    Text("hello")
                                    Text("hey")
                                }
                            }
                            Rectangle().frame(width: 100, height: 100)
                                .foregroundColor(.yellow)
                        }
                    }
                    Spacer()
                } .padding(.leading, 5)
                
                Spacer()
                
                VStack {
                    Rectangle().frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    Spacer()
                } .padding(.trailing, 5)
                
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
