//
//  ContentView.swift
//  LengthConversion
//
//  Created by Hubert Kuczyński on 14/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = Unit.meter
    @State private var outputUnit = Unit.meter
    
    private var inputMeters: Double {
        switch inputUnit {
        case .meter:
            inputValue
        case .kilometer:
            inputValue * 1000.0
        case .feet:
            inputValue * 0.3048
        case .yard:
            inputValue * 0.9144
        case .mile:
            inputValue * 1609.344
        }
    }
    
    private var outputValue: Double {
        switch outputUnit {
        case .meter:
            inputMeters
        case .kilometer:
            inputMeters / 1000.0
        case .feet:
            inputMeters / 0.3048
        case .yard:
            inputMeters / 0.9144
        case .mile:
            inputMeters / 1609.344
        }
    }
    
    var body: some View {
        Form {
            Section("Input") {
                TextField("Value", value: $inputValue, format: .number)
                Picker("Input Unit", selection: $inputUnit) {
                    ForEach(Unit.allCases) {
                        Text($0.abbreviation)
                    }
                }
                Picker("Output Unit", selection: $outputUnit) {
                    ForEach(Unit.allCases) {
                        Text($0.abbreviation)
                    }
                }
            }
            
            Section("Result") {
                Text(outputValue, format: .number)
            }
        }
    }
}

#Preview {
    ContentView()
}
