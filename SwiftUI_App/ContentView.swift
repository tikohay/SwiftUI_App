//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 14.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isOn = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack {
                        Text("Кошелек")
                        Spacer().frame(height: 10)
                        Text("Профиль")
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 10).fill(.yellow).offset(x: isOn ? 100 : 0)
                Text("Что-то на экране")
            }
            Toggle(isOn: $isOn) {
                Text("Показать настройки")
            }.padding()
        }.animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.7))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
