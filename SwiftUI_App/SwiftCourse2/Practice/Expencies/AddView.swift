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
    @State private var num = 0
    
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
            }
            .navigationBarTitle("Add")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
