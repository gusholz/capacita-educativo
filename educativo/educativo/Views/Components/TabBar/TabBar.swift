//
//  TabBar.swift
//  educativo
//
//  Created by Gustavo Holzmann on 06/10/25.
//

import SwiftUI

enum PageTab {
    case content, explore, profile
}

struct TabBarItem: View {
    let FRAME_SIZE: CGFloat = 72
    let TAB_ICONS_SIZE: CGFloat = 25
    var title: String
    var icon: String
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .resizable()
                .frame(width: TAB_ICONS_SIZE, height: TAB_ICONS_SIZE)
                .foregroundStyle(
                    isSelected ? Color.foregroundPrimary :  Color.textSecondary
                )
            Text(title)
                .foregroundStyle(
                    isSelected ? Color.foregroundPrimary :  Color.textSecondary
                )
                .font(.system(size: 14, weight: .medium))
        }
        .frame(width: FRAME_SIZE, height: FRAME_SIZE)
        .foregroundColor(isSelected ? .blue : .gray)
    }
}

struct TabBar: View {
    @Binding var selectedTab: PageTab
    
    var body: some View {
        VStack {
            Divider()
                .frame(height: 1)
                .background(Color.divider)
            HStack(alignment: .lastTextBaseline) {
                Spacer()
                
                TabBarItem(title: "Conteúdo", icon: "graduationcap.fill", isSelected: selectedTab == .content )
                    .onTapGesture {
                        selectedTab = .content
                    }
                
                Spacer()
                
                TabBarItem(title: "Explorar", icon: "magnifyingglass", isSelected: selectedTab == .explore )
                    .onTapGesture {
                        selectedTab = .explore
                    }
                
                Spacer()
                
                TabBarItem(title: "Conta", icon: "person.fill", isSelected: selectedTab == .profile)
                    .onTapGesture {
                        selectedTab = .profile
                    }
                
                Spacer()
            }
        }
    }
}

struct TabBarMenu: View {
    @State var selectedTab: PageTab = .content
    
    var pages: [PageTab : AnyView] = [:]
    init() {
        self.pages[PageTab.content] = AnyView(ContentListScreen())
        self.pages[PageTab.explore] = AnyView(ExploreScreen())
        self.pages[PageTab.profile] = AnyView(ProfileScreen())
    }
    
    var body: some View {
        VStack(){
            Group {
                pages[selectedTab]
            }
            Spacer()
            TabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    TabBarMenu().environment(coordinator)
}
