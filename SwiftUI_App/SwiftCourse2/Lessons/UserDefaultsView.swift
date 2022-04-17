//
//  UserDefaultsView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var secondName: String
}

struct UserDefaultsView: View {
    
    @State private var user = User(firstName: "hello", secondName: "hey")
    
    var body: some View {
        
        Button("Save user") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}
