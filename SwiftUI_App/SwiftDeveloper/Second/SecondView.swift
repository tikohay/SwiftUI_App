//
//  SecondView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 14.04.2022.
//

import SwiftUI

struct SecondView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0
    
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike1", "nike2", "nike3"]
    
    var body: some View {
        VStack {
            Text("Кроссовки - \(company[segmentIndex])").font(.system(.title))
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(.teal).offset(x: CGFloat(offsetX))
                Image(sneakers[segmentIndex]).resizable().frame(width: 300, height: 300).offset(x: CGFloat(offsetX))
            }.animation(.spring())
            Picker(selection: Binding(get: {
                self.segmentIndex
            }, set: { newValue in
                offsetX = 300
                segmentIndex = newValue
                moveBack()
            })) {
                ForEach(0..<company.count) {
                    Text(self.company[$0]).tag($0)
                }
            } label: {
                Text("")
            }.pickerStyle(.segmented).padding()
            Spacer().frame(height: 120)
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            offsetX = 0
        }
    }
}
