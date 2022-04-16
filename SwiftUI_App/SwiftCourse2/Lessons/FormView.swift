//
//  FormView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct FormView: View {
    
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor = 0
    @State private var additionalSettings = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Colors")) {
                    Picker("Select color", selection: $selectedColor) {
                        ForEach.init(0..<colors.count) {
                            Text(colors[$0])
                        }
                    }
                }
                Toggle("Additional settings", isOn: $additionalSettings)
                .navigationBarTitle("Settings")
                Button("Hello") {
                    print("hello")
                }.disabled(additionalSettings)
            }
        }
    }
}
