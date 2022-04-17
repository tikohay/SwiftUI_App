//
//  SheetTransitionView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct MyDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Detail")
            Button("Back") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct MyView5: View {
    
    @State var isShowDetailed = false
    
    var body: some View {
        Button("Show detail") {
            isShowDetailed.toggle()
        } .sheet(isPresented: $isShowDetailed) {
            MyDetailView()
        }
    }
}

struct MyView5_Previews: PreviewProvider {
    static var previews: some View {
        MyView5()
    }
}
