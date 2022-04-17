//
//  ObservedPublishedEnvironment.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct MyView: View {
    
    @ObservedObject private var setting = UserSettings()
    
    var body: some View {
        VStack {
            Text("Your score is \(setting.score)")
            Button("Indrease Score") {
                setting.score += 1
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
