//
//  Tag.swift
//  educativo
//
//  Created by Carlos Jorge on 06/10/25.
//

import Foundation

protocol TagProtocol {
    var id: UUID { get set }
    var name: String { get set }
    var createdAt: Date { get set }
    var updatedAt: Date { get set }
}
