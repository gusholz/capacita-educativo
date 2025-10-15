//
//  ProfileScreen.swift
//  educativo
//
//  Created by Gustavo Holzmann on 06/10/25.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var isDarkModeEnabled: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Conta")
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical)
            Section(header: Text("GERAL")) {
                HStack {
                    Image(systemName: "bookmark.fill")
                    Text("Itens Salvos")
                    Spacer()
                    Button {
                        print("open save contents...")
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.textSecondary)
                    }
                }
            }
            Section(header: Text("PREFERÊNCIAS")) {
                HStack {
                    Image(systemName: "moonphase.last.quarter")
                    Text("Aparência")
                    Spacer()
                    Text("Dia")
                        .foregroundStyle(Color.textSecondary)
                    Button {
                        print("open save contents...")
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.textSecondary)
                    }
                }
                
                HStack {
                    Image(systemName: "bell.fill")
                        .foregroundStyle(Color.textSecondary)
                    Text("Notificações")
                    Spacer()
                    Button {
                        isDarkModeEnabled.toggle()
                    } label: {
                        Toggle(isOn: $isDarkModeEnabled) {
                            
                        }
                    }
                }
            }
            
            Section(header: Text("SOBRE")) {
                HStack {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Itens Salvos")
                    Spacer()
                    Button {
                        print("open save contents...")
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.textSecondary)
                    }
                }
            }
            
            Button {
                print("Abrir tela de login")
            } label: {
                Text("Entrar")
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileScreen()
}
