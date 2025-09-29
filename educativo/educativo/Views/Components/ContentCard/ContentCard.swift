//
//  ContentCard.swift
//  educativo
//
//  Created by Gustavo Holzmann on 29/09/25.
//

import SwiftUI

struct ContentCard: View {
    var text: String
    var createdAt: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Image("mockImage")
                    .resizable()
                    .frame(width: 114, height: 114)
            }
            
            Divider()
            
            HStack {
                Text(createdAt)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )

    }
}

#Preview {
    ContentCard(
        text: "7 Técnicas de Estudo que Ajudaram Estudantes a Dobrar suas Notas",
        createdAt: "3 Dias Atrás",
        action: { print("hi!") }
    )
        .padding()
}
