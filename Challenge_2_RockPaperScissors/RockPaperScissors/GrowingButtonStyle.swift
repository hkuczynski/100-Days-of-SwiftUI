//
//  GrowingButtonStyle.swift
//  RockPaperScissors
//
//  Created by Hubert Kuczyński on 21/04/2024.
//

import SwiftUI

struct GrowingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Button {
        print("Button pressed")
    } label: {
        Text("Hello")
    }.buttonStyle(GrowingButtonStyle())
}
