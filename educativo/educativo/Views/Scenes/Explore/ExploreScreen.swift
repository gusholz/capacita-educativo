//
//  ExploreScreen.swift
//  educativo
//
//  Created by Gustavo Holzmann on 06/10/25.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let title: String
    let sfImageName: String
    let foregroundColor: Color
    let backgroundColor: Color
}

private var mockList: [Category] = [
    Category(title: "Work",
             sfImageName: "briefcase.fill",
             foregroundColor: .white,
             backgroundColor: .blue),
    Category(title: "Personal",
             sfImageName: "person.fill",
             foregroundColor: .white,
             backgroundColor: .orange),
    Category(title: "Health",
             sfImageName: "heart.fill",
             foregroundColor: .white,
             backgroundColor: .red)
]

struct ExploreScreen: View {
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explorar")
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical)
                .padding(.leading)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(mockList, id: \.id) { category in
                        CategoryCard(
                            categoryTitle: category.title,
                            sfImageName: category.sfImageName,
                            foregroundColor: category.foregroundColor,
                            backgroundColor: category.backgroundColor
                        )
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ExploreScreen()
}
