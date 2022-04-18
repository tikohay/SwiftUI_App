//
//  AddView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var expenses: Expenses
    
    let types = ["Busines", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: Binding(get: {
                    type
                }, set: { newValue in
                    type = newValue
                })) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Price", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let expense = ExpenceItem(name: name, type: type, amount: actualAmount)
                    expenses.items.append(expense)
                    presentation.wrappedValue.dismiss()
                }
            })
        }
    }
}
