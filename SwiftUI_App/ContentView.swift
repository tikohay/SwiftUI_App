//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 14.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var section = 0
    @State var percentSection = 0
    @State var isOn = false
    var settingsTime = ["5 min", "10 min", "15 min"]
    var percents = ["10 percents", "50 percents", "100 percents"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $section) {
                    ForEach(0..<settingsTime.count) {
                        Text(settingsTime[$0])
                    }
                } label: {
                    Text("Time")
                }
                Toggle(isOn: $isOn) {
                    Text("Plane mode").foregroundColor(.pink)
                }
                Picker(selection: $percentSection) {
                    ForEach(0..<percents.count) {
                        Text(percents[$0])
                    }
                } label: {
                    Text("")
                }
            }.navigationTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
