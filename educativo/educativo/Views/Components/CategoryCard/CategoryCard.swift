//
//  CategoryCard.swift
//  educativo
//
//  Created by Gustavo Holzmann on 30/09/25.
//

import SwiftUI

struct CategoryCard: View {
    var categoryTitle: String
    var sfImageName: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.backgroundPrimary)
                    .overlay(
                        Image(systemName: sfImageName)
                    )
            }
            
            Spacer()
            
            HStack {
                Text(categoryTitle)
                    .font(.system(size: 22, weight: .bold))
                Spacer()
            }
        }
        .frame(width: 150, height: 150)
        .padding()
        .background(backgroundColor)
        .cornerRadius(16)
    }
}

#Preview {
    CategoryCard(
        categoryTitle: "Saúde",
        sfImageName: "heart.fill",
        foregroundColor: .black,
        backgroundColor: .yellow
    )
}
