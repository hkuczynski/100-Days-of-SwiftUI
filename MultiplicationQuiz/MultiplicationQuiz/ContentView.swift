//
//  ContentView.swift
//  MultiplicationQuiz
//
//  Created by Hubert Kuczyński on 24/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Bindable var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        switch viewModel.gameState {
        case .maxNumberSelection:
            MaxNumberSelectionView(viewModel: viewModel)
        case .questionsCountSelection:
            QuestionsCountSelectionView(viewModel: viewModel)
        case .inProgress:
            GameInProgressView()
        case .finished:
            GameFinishedView()
        }
    }
}

#Preview {
    ContentView()
}
