//
//  AnimationView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 18.04.2022.
//

import SwiftUI

struct MyAnimationView: View {
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button("Hello") {
            scale += 1
        } .scaleEffect(scale)
            .animation(.linear)
    }
}

struct MyAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MyAnimationView()
    }
}
