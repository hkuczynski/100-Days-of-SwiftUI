//
//  MaxNumberSelectionView.swift
//  MultiplicationQuiz
//
//  Created by Hubert Kuczyński on 24/06/2024.
//

import SwiftUI

struct MaxNumberSelectionView: View {
    
    @Bindable var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        Text("What's the max number?")
        
        Button {
            viewModel.provideMaxNumber("10")
        } label: {
            Text("Continue")
        }
    }
}

#Preview {
    MaxNumberSelectionView()
}
