//
//  TextFieldView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 15.04.2022.
//

import SwiftUI

struct TextfieldView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Введите логин", text: $text)
                .redTextField()
                
            TextField("Введите пароль", text: $text) { changed in
                print(changed)
            } onCommit: {
                print("onCommit")
            }
            .modifier(TextFieldModifier())
            Button {
                print(text)
            } label: {
                Text("Login")
            }
            .gesture(
                TapGesture()
                    .onEnded({ _ in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    })
            )
        }.padding()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension TextField {
    func redTextField() -> some View {
        modifier(TextFieldModifier())
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red)
            )
    }
}

struct TextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldView()
    }
}
