//
//  RegistrationView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 18.04.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var index = 1
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("nike")
                    .resizable()
                    .frame(width: 70, height: 70)
                
                ZStack {
                    SignUp(index: $index)
                        .zIndex(Double(self.index))
                    LoginView(index: $index)
                }
                
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(.brown)
                        .frame(height: 1)
                    
                    Text("OR")
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .fill(.brown)
                        .frame(height: 1)
                } .padding(.horizontal, 30)
                    .padding(.top, 50)
                
                HStack(spacing: 25) {
                    Button {
                        print("hello")
                    } label: {
                        Image(systemName: "applelogo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        print("hello")
                    } label: {
                        Image(systemName: "logo.playstation")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        print("hello")
                    } label: {
                        Image(systemName: "logo.xbox")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .background(.black).edgesIgnoringSafeArea(.all)
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape2: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 100))
        }
    }
}

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor((self.index == 0 ? .white : .gray))
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? .blue : .clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer()
                }
                .padding(.top, 30)
                VStack {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.brown)
                        TextField("Email adress", text: $email)
                    }
                    Divider()
                        .background(.black)
                } .padding(.horizontal)
                    .padding(.top, 40)
                
                VStack {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.brown)
                        SecureField("Password", text: $password)
                    }
                }
                .padding()
                .padding(.top, 30)
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("hello")
                    } label: {
                        Text("Forgot password")
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(.yellow)
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button {
                print("hello")
            } label: {
                Text("Login")
                    .padding()
                    .background(.yellow)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUp: View {
    @State var email = ""
    @State var password = ""
    @State var repass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        Text("SignUP")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? .blue : .clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.brown)
                        TextField("Email Address", text: $email)
                    }
                    Divider().background(.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.brown)
                        SecureField("Password", text: $password)
                    }
                    Divider()
                        .background(.white)
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.brown)
                        SecureField("Password", text: $repass)
                    }
                    Divider().background(.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(.yellow)
            .clipShape(CShape2())
            .contentShape(CShape2())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal)
            
            Button {
                print("hello")
            } label: {
                Text("Sign up")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(.brown)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
