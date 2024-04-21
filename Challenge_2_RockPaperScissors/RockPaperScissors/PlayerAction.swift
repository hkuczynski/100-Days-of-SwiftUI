//
//  PlayerAction.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import Foundation

enum PlayerAction: CaseIterable {
    case win
    case lose
    
    var uiString: String {
        switch self {
        case .win:
            "Win"
        case .lose:
            "Lose"
        }
    }
}
