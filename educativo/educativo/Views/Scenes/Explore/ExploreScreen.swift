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
             foregroundColor: .black,
             backgroundColor: .red),
    Category(title: "Personal",
             sfImageName: "person.fill",
             foregroundColor: .cyan,
             backgroundColor: .orange),
    Category(title: "Health",
             sfImageName: "heart.fill",
             foregroundColor: .orange,
             backgroundColor: .red)
]

struct ExploreScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
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
                        Button {
                            coordinator.navigate(to: .contentList)
                        } label: {
                            CategoryCard(
                                categoryTitle: category.title,
                                sfImageName: category.sfImageName,
                                foregroundColor: category.foregroundColor,
                                backgroundColor: category.backgroundColor
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    ExploreScreen().environment(coordinator)
}
