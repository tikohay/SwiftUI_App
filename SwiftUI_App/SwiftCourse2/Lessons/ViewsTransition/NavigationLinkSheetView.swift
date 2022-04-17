//
//  NavigationLinkSheetView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct Dog: Identifiable {
    var id = UUID()
    var name: String
}

struct DogRow: View {
    
    var dog: Dog
    
    var body: some View {
        Text(dog.name)
    }
}

struct DogView3: View {
    
    var dog: Dog
    
    var body: some View {
        Text(dog.name)
    }
}

struct MyView3: View {
    
    var body: some View {
        let first = Dog(name: "hello")
        let second = Dog(name: "hey")
        let dogs = [first, second]
        
        NavigationView {
            List(dogs) { dog in
                NavigationLink(destination: DogView3(dog: dog)) {
                    DogRow(dog: dog)
                }
            } .navigationBarTitle("choose a dog")
        }
    }
}
