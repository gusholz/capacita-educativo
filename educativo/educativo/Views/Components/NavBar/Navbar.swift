//
//  Navbar.swift
//  educativo
//
//  Created by Gustavo Holzmann on 07/10/25.
//

import SwiftUI

enum NavbarRightButtonType {
    case none
    case ellipsis
    case save
}

struct Navbar: View {
    var rightButtonType: NavbarRightButtonType
    var dismissAction: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.system(size: 20, weight: .semibold))
                .onTapGesture {
                    dismissAction()
                }
            Spacer()
            
            switch rightButtonType {
            case .none:
                Color.clear
            case .ellipsis:
                Image(systemName: "ellipsis")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundStyle(.secondary)
                    .contextMenu {
                        Button {
                            print("Compartilhando Link!")
                        } label: {
                            Text("Compartilhar Link")
                        }
                        Button {
                            print("Salvando publicação!")
                        } label: {
                            Text("Salvar Publicação")
                        }
                    }
            case .save:
                Text("Salvar")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    Navbar(rightButtonType: .none) {
        
    }
}
