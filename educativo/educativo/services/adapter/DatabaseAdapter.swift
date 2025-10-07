//
//  DatabaseAdapter.swift
//  educativo
//
//  Created by Carlos Jorge on 06/10/25.
//

import Foundation

protocol LoginProtocol {
    var token: String {get set}
    var userId: UUID {get set}
}

protocol DatabaseAdapter {
    func getAllUsers(token: String) async -> [UserProtocol]
    func getUserById(userId: UUID, token: String) async -> UserProtocol
    func getAllUserPosts(userId: UUID, token: String) async -> [PostProtocol]
    func getAllUserSavedItens(userId: UUID, token: String) async -> [PostProtocol]
    func createUser(login: String, password: String, role: RoleEnum) -> UserProtocol?
    func login(login: String, password: String) -> LoginProtocol?
    
    func getPostById(postId: UUID, token: String) -> PostProtocol
    func getAllPosts(token: String) -> [PostProtocol]
    func getPostByTag(tagIds: [UUID], token: String) -> [PostProtocol]
    func getTagsByPost(postIds: [UUID], token: String) -> [TagProtocol]
    func addTagsToPost(tagIds: [UUID], postId: UUID, token: String) -> PostProtocol?
    func removeTagsToPost(tagIds: [UUID], postId: UUID, token: String) -> PostProtocol?
    func createPost(userId: UUID, title: String, textBody: String, imageURL: String?, url: String?, token: String) -> PostProtocol?
    func removePost(postId: UUID, token: String) -> PostProtocol?
    
    func unsavePostToUser(userId: UUID, postId: UUID, token: String) -> PostProtocol?
    func savePostToUser(userId: UUID, postId: UUID, token: String) -> PostProtocol?
    
    func addTag(name: String, token: String) -> TagProtocol?
    func removeTag(tagId: UUID, token: String) -> TagProtocol?
}
