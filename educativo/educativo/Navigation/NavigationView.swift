//
//  NavigationView.swift
//  educativo
//
//  Created by Gustavo Holzmann on 29/09/25.
//

import SwiftUI

struct GeneralCoordinatorView: View {
    @State var coordinator = GeneralCoordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .main).navigationDestination(for: Page.self) { page in
                coordinator.build(page: page)
            }
//            .sheet(item: $coordinator.sheet) {
//                sheet in coordinator.build(sheet: sheet)\
//            }
//            .fullScreenCover(item: $coordinator.fullScreenCover) {
//                fullScreenCover in coordinator.build(fullScreenCover: fullScreenCover)
//            }
        }.environment(coordinator)
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    GeneralCoordinatorView().environment(coordinator)
}
