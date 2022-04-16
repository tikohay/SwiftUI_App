//
//  AlertView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct AlertView: View {
    
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    
    var body: some View {
        HStack {
            Button("Button") {
                showingAlert = true
            } .alert(isPresented: $showingAlert) {
                Alert(title: Text("hello"), message: Text("message"), dismissButton: .default(Text("ok")))
            }
            Button("Button2") {
                showingAlert2 = true
            } .alert(isPresented: $showingAlert2) {
                Alert(title: Text("button2"), message: Text("hello"), dismissButton: .cancel())
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
