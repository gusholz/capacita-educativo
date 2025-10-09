//
//  Navbar.swift
//  educativo
//
//  Created by Gustavo Holzmann on 07/10/25.
//

import SwiftUI

struct Navbar: View {
    var has_custom_action: Bool = false
    var dismissAction: () -> Void
    var customAction: () -> Void = {}
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.system(size: 20, weight: .semibold))
                .onTapGesture {
                    dismissAction()
                }
            Spacer()
            
            if has_custom_action {
                Image(systemName: "ellipsis")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundStyle(.secondary)
                    .onTapGesture {
                        customAction()
                    }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    Navbar {
        
    } customAction: {
        
    }

}
