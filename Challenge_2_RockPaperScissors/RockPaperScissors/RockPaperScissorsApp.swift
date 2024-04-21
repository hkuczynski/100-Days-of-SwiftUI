//
//  RockPaperScissorsApp.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

/*
This is a 2nd challange from 100 Days with SwiftUI course.
 
 A brain training game that challenges players to win or lose at rock, paper, scissors.
 The game operates with the following rules:
    -  Each turn of the game, the app randomly selects either rock, paper, or scissors.
    -   Alternately, the app prompts the player to either win or lose the game.
    -  The player must tap the correct move to either win or lose according to the prompt.
    -  A correct move awards the player a point, while an incorrect move deducts a point.
    -   The game concludes after 10 questions, after which the player's score is displayed.
 
 This game integrates concepts of arrays, state, views, images, and text to create an engaging gameplay experience.
 */

import SwiftUI

@main
struct RockPaperScissorsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
