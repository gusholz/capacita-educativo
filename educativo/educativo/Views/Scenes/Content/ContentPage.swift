//
//  ContentPage.swift
//  educativo
//
//  Created by Gustavo Holzmann on 06/10/25.
//

import SwiftUI

struct ContentPage: View {
    @Environment(GeneralCoordinator.self) var coordinator
    var title: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Spacer()
                
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                Text(text)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    ContentPage(
        title: "7 Técnicas de Estudo",
        text: "lorem impsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!"
    ).environment(coordinator)
}
