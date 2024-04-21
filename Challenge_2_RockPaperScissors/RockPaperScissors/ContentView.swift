//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameController: GameController = GameController()
    
    var body: some View {
        Group {
            switch gameController.gameState {
            case .inProgress:
                GameInProgressView()
            case .finished:
                GameFinishedView()
            }
        }.environmentObject(gameController)
    }
}

#Preview {
    ContentView()
}
