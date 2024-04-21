//
//  GameFinishedView.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import SwiftUI

struct GameFinishedView: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        VStack {
            Text("Game Over")
            Text("Score: \(gameController.score)")
            Spacer()
            Button {
                gameController.restartGame()
            } label: {
                Text("Play again")
            }.buttonStyle(GrowingButtonStyle())
        }.padding()
    }
}



#Preview {
    GameFinishedView().environmentObject(GameController())
}
