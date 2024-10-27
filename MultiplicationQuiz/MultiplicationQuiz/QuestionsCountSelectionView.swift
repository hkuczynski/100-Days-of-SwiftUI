//
//  QuestionsCountSelectionView.swift
//  MultiplicationQuiz
//
//  Created by Hubert Kuczyński on 24/06/2024.
//

import SwiftUI

struct QuestionsCountSelectionView: View {
    
    @Bindable var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        Text("How many questions you want to receive??")

        Button {
            viewModel.provideQuestionsCount("20")
        } label: {
            Text("Continue")
        }
    }
}

#Preview {
    QuestionsCountSelectionView()
}
