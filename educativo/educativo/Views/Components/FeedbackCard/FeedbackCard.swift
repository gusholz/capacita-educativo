//
//  FeedbackCard.swift
//  educativo
//
//  Created by Gustavo Holzmann on 30/09/25.
//

import SwiftUI

struct FeedbackCard: View {
    var text: String
    var dismissAction: () -> Void
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
            Button {
                dismissAction()
            } label: {
                Image(systemName: "clear")
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(8)
    }
}

#Preview {
    FeedbackCard(text: "História finalizada com sucesso") {
        print("Hi! Dismissed!")
    }
}
