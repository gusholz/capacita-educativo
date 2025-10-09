//
//  NavigationManager.swift
//  educativo
//
//  Created by Gustavo Holzmann on 29/09/25.
//

import SwiftUI

protocol CoordinatorProtocol {
    var path: NavigationPath { get set }
}

enum Page: String, Identifiable {
    case main
    case contentPage
    case contentList

    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            ContentView()
        case .contentPage:
            ContentPage(title: "Como passar esses dados?", text: "Vamo ver o que sai daqui")
        case .contentList:
            ContentListScreen()
        }
    }
}

enum Sheets: String, Identifiable {
    case firstSheet
    
    var id: String {
        self.rawValue
    }
    
//    @ViewBuilder
//    var view: some view {
//        switch self {
//        case .firstSheet:
//            FirstSheet()
//        }
//    }
}

enum FullScreenCover: String, Identifiable {
    case contentList
    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .contentList:
            ContentListScreen()
        }
    }
}

@Observable
class GeneralCoordinator {
    var path = NavigationPath()
    var sheet: Sheets?
    var fullScreenCover: FullScreenCover?
    
//    @MainActor
//    var appViewModel = appViewModel()
//
    @MainActor func build(page: Page) -> some View {
        return page.view// .environment(appViewModel)
    }
//    func build(sheet: Sheets) -> some View {
//        return sheet.view
//    }
    func build(fullScreenCover: FullScreenCover) -> some View {
        return fullScreenCover.view
    }
    
    func present(sheet: Sheets){
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover){
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissSheet(){
        self.sheet = nil
    }
    
    func dismisFullScreenCover(){
        self.fullScreenCover = nil
    }
    
    func navigate(to route: Page) {
        path.append(route)
    }
    
    func navigate(to flow: [Page]) {
        flow.forEach { page in
            path.append(page)
        }
    }
    
    func pop() {
        path.removeLast()
    }
    
    func pop(_ number: Int){
        path.removeLast(number)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
