//
//  ContentScreen.swift
//  educativo
//
//  Created by Gustavo Holzmann on 06/10/25.
//

import SwiftUI

enum FilterOptions {
    case popular, recents
}

struct ContentListScreen: View {
    // TODO: Add filter functionality
    @Environment(GeneralCoordinator.self) var coordinator
    @State private var activerFilter: FilterOptions = .popular

    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let createdAt: String
    }

    private var mockList: [Item] = [
        Item(title: "Teste la", createdAt: "20/06"),
        Item(title: "sei la", createdAt: "20/06"),
        Item(title: "Poggers la", createdAt: "20/06"),
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Aprender Mais")
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical)
                .padding(.leading)

            HStack {
                Button {
                    activerFilter = .popular
                } label: {
                    VStack {
                        Text("Populares")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(
                                activerFilter == .popular ? .black : .gray)
                        if activerFilter == .popular {
                            Rectangle()
                                .foregroundStyle(Color.foregroundPrimary)
                                .frame(width: 188, height: 2)
                        } else {
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: 188, height: 2)
                        }

                    }
                }

                Spacer()

                Button {
                    activerFilter = .recents
                } label: {
                    VStack {
                        Text("Recentes")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(
                                activerFilter == .recents ? .black : .gray)
                        if activerFilter == .recents {
                            Rectangle()
                                .foregroundStyle(
                                    Color(
                                        red: 27 / 255, green: 78 / 255,
                                        blue: 102 / 255)
                                )
                                .frame(width: 188, height: 2)
                        } else {
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: 188, height: 2)
                        }

                    }
                }
            }
            ScrollView {
                ForEach(mockList, id: \.id) { list in
                    Button {
                        coordinator.navigate(to: .contentPage)
                    } label: {
                        ContentCard(text: list.title, createdAt: list.createdAt)
                        {
                            print("Hi!")
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }

        }
        .background(Color(red: 248 / 255, green: 249 / 255, blue: 251 / 255))
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    ContentListScreen().environment(coordinator)
}
