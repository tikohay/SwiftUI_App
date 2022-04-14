//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 14.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isError = false
    
    var body: some View {
        showAlert()
    }
    
    fileprivate func showAlert() -> some View {
        return Button("Button") {
            self.isError = true
        }.alert(isPresented: $isError, content: {
            Alert(title: Text("Test"), message: Text("Hello"), primaryButton: .destructive(Text("hey"), action: {
                print("test")
            }), secondaryButton: .cancel())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
