//
//  Post.swift
//  educativo
//
//  Created by Carlos Jorge on 06/10/25.
//

import Foundation

protocol PostProtocol {
    var id: UUID { get set }
    var userId: UUID { get set }
    var title: String { get set }
    var bodyText: String { get set }
    var imageUri: String? { get set }
    var url: String? { get set }
    var createdAt: Date { get set }
    var updatedAt: Date { get set }
}
