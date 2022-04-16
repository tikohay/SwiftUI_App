//
//  ListView2.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 16.04.2022.
//

import SwiftUI

struct TaskRow: View {
    
    var body: some View {
        Text("some task")
    }
}

struct ListView2: View {
    
    var body: some View {
        List {
            Section(header: Text("Important tasks"), footer: Text("hello")) {
                TaskRow()
                TaskRow()
                TaskRow().listRowBackground(Color.yellow)
            }
            Section(header: Text("Another tasks")) {
                TaskRow()
                TaskRow()
            }
        }
    }
}

struct ListView2_Previews: PreviewProvider {
    static var previews: some View {
        ListView2()
    }
}
