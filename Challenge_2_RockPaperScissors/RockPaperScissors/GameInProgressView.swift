//
//  GameInProgressView.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import SwiftUI

struct GameInProgressView: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        Text(gameController.opponentMove.uiString)
            .font(.system(size: 82))
            .padding()
        
        Spacer()
        
        Text("Your task: \(gameController.playerAction.uiString)")
        
        Text("Score: \(gameController.score)")
        
        Spacer()
        
        HStack {
            ForEach(gameController.playerMoves) { move in
                Button {
                    gameController.playerSelected(move: move)
                } label: {
                    Text(move.uiString)
                        .font(.system(size: 82))
                }.buttonStyle(GrowingButtonStyle())

            }
        }.padding()
    }
}

#Preview {
    GameInProgressView().environmentObject(GameController())
}
