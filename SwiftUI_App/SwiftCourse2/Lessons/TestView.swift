//
//  TestView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 19.04.2022.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var lastname: String
}

struct PersonRow: View {
    
    var person: Person
    
    var body: some View {
        Text(person.name)
    }
}

struct TestView: View {
    
    @State private var text = ""
    @State private var persons = [Person(name: "Dwayne", lastname: "Johnson"),
                                  Person(name: "Dwayne", lastname: "Johnson"),
                                  Person(name: "Dwayne", lastname: "Johnson")]
    
    var body: some View {
        VStack {
            NavigationView {
                List (persons) { person in
                    PersonRow(person: person)
                }
            }
        }
    }
}

struct ButtonView: View {
    
    @Binding var text: String
    
    var body: some View {
        Button {
            self.text = "hey"
        } label: {
            Text("second button")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
