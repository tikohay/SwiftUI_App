//
//  GesturesView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct GestureView: View {
    
    @State var text = "Tap me"
    var body: some View {
        VStack {
            Text(text).position(x: 30, y: 30).padding()
                .onTapGesture(count: 2) {
                    text = "hello"
                }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { _ in
                    text = "hey"
                }
        )
    }
}
