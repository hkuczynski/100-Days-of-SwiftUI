//
//  RPSMove.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import Foundation

enum RPSMove: CaseIterable {
    case rock
    case paper
    case scissors
    
    var uiString: String {
        switch self {
        case .rock:
            "🪨"
        case .paper:
            "📃"
        case .scissors:
            "✂️"
        }
    }
}

extension RPSMove: Identifiable {
    var id: Self { self }
}
