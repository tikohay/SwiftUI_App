//
//  ModifiersLesson.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct CustomModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(.pink)
            .font(.largeTitle)
    }
}

struct ModifierLessonView: View {
    
    @State private var useGreenText = false
    
    var body: some View {
        VStack {
            Text("hello")
                .modifier(CustomModifier())
        }
    }
}
