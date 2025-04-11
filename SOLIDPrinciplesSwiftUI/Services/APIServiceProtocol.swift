//
//  APIServiceProtocol.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/11/25.
//

import Foundation

protocol APIServiceProtocol {
    func getCommentList(completion: @escaping (Result<[CommentModel], CustomError>) -> Void)
    func getUserList(completion: @escaping (Result<[UserModel], CustomError>) -> Void)
    func getPostList(completion: @escaping (Result<[PostModel], CustomError>) -> Void)
}

protocol APIServiceDelegate {
    func getComments(completion: @escaping (Result<[CommentModel], CustomError>) -> Void)
    func getPosts(completion: @escaping (Result<[PostModel], CustomError>) -> Void)
    func getUsers(completion: @escaping (Result<[UserModel], CustomError>) -> Void)
}
