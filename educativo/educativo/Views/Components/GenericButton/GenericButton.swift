//
//  GenericButton.swift
//  educativo
//
//  Created by Gustavo Holzmann on 30/09/25.
//

import SwiftUI

struct GenericButton: View {
    var label: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: CGFloat(16))
                .foregroundStyle(backgroundColor)
                .frame(height: 48)
                .overlay(
                    Text(label)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.backgroundPrimary)
                )
        }
        
    }
}

#Preview {
    GenericButton(label: "Próximo", backgroundColor: Color(.darkGray)) {
        print("Apertado!")
    }
}
