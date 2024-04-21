//
//  GameResolver.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import Foundation

class GameController: ObservableObject {
    @Published var score: Int = 0
    @Published var roundNumber: Int = 0
    @Published var playerAction: PlayerAction = .win
    @Published var opponentMove: RPSMove = .rock
    @Published var gameState: GameState = .inProgress
    
    var playerMoves: [RPSMove] {
        RPSMove.allCases
    }
    
    func playerSelected(move: RPSMove) {
        updatePlayerScore(playerMove: move)
        if roundNumber >= 9 {
            gameState = .finished
        } else {
            prepareNextRound()
        }
    }
    
    func restartGame() {
        score = 0
        roundNumber = 0
        gameState = .inProgress
        prepareNextRound()
    }
    
    private func prepareNextRound() {
        playerAction = PlayerAction.allCases.shuffled().first ?? playerAction
        opponentMove = RPSMove.allCases.shuffled().first ?? opponentMove
        roundNumber += 1
    }
        
    private func updatePlayerScore(playerMove: RPSMove) {
        let result = checkResult(a: playerMove, b: opponentMove)
        let roundPoints: Int
        switch playerAction {
        case .win:
            roundPoints = result == 1 ? 1 : 0
        case .lose:
            roundPoints = result == -1 ? 1 : 0
        }
        
        score += roundPoints
    }
    
    private func checkResult(a: RPSMove, b: RPSMove) -> Int {
        switch (a, b) {
        case (.rock, .paper):
            return 1
        case (.rock, .scissors):
            return -1
        case (.scissors, .paper):
            return 1
        case (.scissors, .rock):
            return -1
        case (.paper, .scissors):
            return -1
        case (.paper, .rock):
            return 1
        case (.paper, .paper):
            return 0
        case (.scissors, .scissors):
            return 0
        case (.rock, .rock):
            return 0
        }
    }
}
