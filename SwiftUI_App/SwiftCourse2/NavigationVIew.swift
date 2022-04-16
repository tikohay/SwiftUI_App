//
//  NavigationVIew.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct TestNavigationView: View {
    
    @State private var users = ["John", "Dwayne", "Jason"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                } .onDelete(perform: { delete(at: $0) })
                    .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationView()
    }
}
