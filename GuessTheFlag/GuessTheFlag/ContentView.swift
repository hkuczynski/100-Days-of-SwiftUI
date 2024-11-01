//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hubert Kuczyński on 14/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var showingResults = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", 
        "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var attempts = 0
    @State private var tappedFlagIndex: Int? = nil
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation(.spring(duration: 3, bounce: 0.5)) {
                                       print("start \(String(describing: tappedFlagIndex))")
                                       tappedFlagIndex = number
                                       print("end \(String(describing: tappedFlagIndex))")
                                   }
                                   
                                   // Delay the execution of the completion code to roughly match the animation duration
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                       print("completion \(String(describing: tappedFlagIndex))")
                                       flagTapped(number)
                                       tappedFlagIndex = nil
                                   }
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .rotation3DEffect(
                                    .degrees(tappedFlagIndex == number ? 360 : 0), axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .opacity((tappedFlagIndex == number || tappedFlagIndex == nil) ? 1 : 0.25)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }.padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }.alert("The End", isPresented: $showingResults) {
            Button("Play Again", action: playAgain)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func playAgain() {
        score = 0
        attempts = 0
        askQuestion()
    }
    
    private func flagTapped(_ number: Int) {
        attempts += 1
        
        if (number == correctAnswer) {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        print("attempts \(attempts) showingResults \(showingResults) showingScore \(showingScore)")
        
        if (attempts >= 8) {
            showingResults = true
        } else {
            showingScore = true
        }
    }
}

#Preview {
    ContentView()
}
