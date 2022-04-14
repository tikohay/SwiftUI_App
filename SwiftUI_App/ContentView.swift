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
        }.actionSheet(isPresented: $isError) {
            ActionSheet(title: Text("hello"), message: Text("test"), buttons: [.cancel(), .default(Text("Hello"), action: {
                print("hello")
            })])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
