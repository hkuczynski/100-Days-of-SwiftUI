//
//  GameViewModel.swift
//  MultiplicationQuiz
//
//  Created by Hubert Kuczyński on 24/06/2024.
//

import Foundation
import Combine

@Observable
final class GameViewModel {
    private(set) var gameState: GameState = .maxNumberSelection
    private(set) var question: Question?
    private var questions: [Question] = []
    private var maxNumber: Int? = nil
    private var questionsCount: Int? = nil
    
    func provideMaxNumber(_ value: String) {
        guard let number = Int(value) else {
            return
        }
        
        maxNumber = number
        gameState = .questionsCountSelection
    }
    
    func provideQuestionsCount(_ value: String) {
        guard let number = Int(value) else {
            return
        }
        
        questionsCount = number
        gameState = .inProgress
        
        
    }
}
