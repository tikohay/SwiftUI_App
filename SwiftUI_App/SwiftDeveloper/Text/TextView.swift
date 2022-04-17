//
//  TextView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 15.04.2022.
//

import SwiftUI

struct TextView: View {
    
    var body: some View {
//        Text("hello hello hello hello hello hello".uppercased())
//            .kerning(5)
//            .underline(true, color: .yellow)
//            .strikethrough(true, color: .blue)
//            .italic()
//            .bold()
//            .lineLimit(nil)
//            .multilineTextAlignment(.center)
//            .background(.teal)
//            .foregroundColor(.white)
//            .lineSpacing(10)
//            .frame(width: 200, height: 200)
//            .minimumScaleFactor(0.1)
        HStack {
            Text("hello")
                .baselineOffset(-10)
                .border(.red)
            Text("hello")
                .border(.red)
            Text("hello")
                .baselineOffset(10)
                .border(.red)
        }
    }
}
