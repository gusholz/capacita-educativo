//
//  User.swift
//  educativo
//
//  Created by Carlos Jorge on 06/10/25.
//

import Foundation

enum RoleEnum {
    case admin
    case viewer
}

protocol UserProtocol {
    var id: UUID { get set }
    var role: RoleEnum { get set }
    var login: String { get set }
    var password: String { get set }
    var createdAt: Date { get set }
    var updatedAt: Date { get set }
}
