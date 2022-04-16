//
//  TipCalculate.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct TipCalculate: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    @State private var tipPercentages = [0, 5, 10, 15, 20]
    
    var percent: Double {
        (Double(checkAmount) ?? 0) + Double(numberOfPeople)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0)")
                        }
                    }
                }
                Section("What tip do you want to leave") {
                    Picker("Top percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text("\(percent, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Tip calculate", displayMode: .inline)
        }
    }
}
