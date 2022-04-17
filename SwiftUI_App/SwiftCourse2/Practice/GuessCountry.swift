//
//  GuessCountry.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct GuessCountryView: View {
    
    @State private var countries = ["USA", "Canada", "UE"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Choose country")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.headline)
                }
                ForEach(0..<3) { num in
                    Button {
                        flagTapped(num)
                        showingScore = true
                    } label: {
                        Image(self.countries[num])
                            .resizable()
                            .frame(width: 90, height: 50)
                            .clipShape(Capsule())
                    }
                }
                Text("Score \(score)")
                    .font(.largeTitle)
                Spacer().frame(height: 100)
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Total score: \(score)"), dismissButton: .default(Text("continue")) {
                askQuestion()
            })
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct answer!"
            score += 1
        } else {
            scoreTitle = "Wrong! It's \(countries[number])"
            score -= 1
        }
    }
}

struct GuessCountry_Previews: PreviewProvider {
    static var previews: some View {
        GuessCountryView()
    }
}
