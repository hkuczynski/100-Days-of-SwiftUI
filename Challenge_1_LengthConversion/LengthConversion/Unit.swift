//
//  Unit.swift
//  LengthConversion
//
//  Created by Hubert Kuczyński on 14/04/2024.
//

import Foundation

enum Unit: CaseIterable {
    case meter
    case kilometer
    case feet
    case yard
    case mile
    
    var abbreviation: String {
        switch self {
        case .meter:
            "m"
        case .kilometer:
            "km"
        case .feet:
            "ft"
        case .yard:
            "yd"
        case .mile:
            "mi"
        }
    }
}

extension Unit: Identifiable {
    var id: Self { self }
}
