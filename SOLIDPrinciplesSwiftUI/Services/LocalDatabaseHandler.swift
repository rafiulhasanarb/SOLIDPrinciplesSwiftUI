//
//  LocalDatabaseHandler.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/11/25.
//

import Foundation

class LocalDatabaseHandler: APIServiceProtocol {
    func getCommentList(completion: @escaping (Result<[CommentModel], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "comments", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([CommentModel].self, from: data) else {
            return completion(.failure(.DecodingError))
        }
        completion(.success(decodedData))
    }
    
    func getUserList(completion: @escaping (Result<[UserModel], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json"), let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([UserModel].self, from: data) else {
            return completion(.failure(.DecodingError))
        }
        completion(.success(decodedData))
    }
    
    func getPostList(completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([PostModel].self, from: data) else {
            return completion(.failure(.DecodingError))
        }
        completion(.success(decodedData))
    }
}

extension LocalDatabaseHandler: APIServiceDelegate {
    func getComments(completion: @escaping (Result<[CommentModel], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "comments", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([CommentModel].self, from: data) else {
            return completion(.failure(.DecodingError))
        }
        completion(.success(decodedData))
    }
    
    func getPosts(completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([PostModel].self, from: data) else {
            return completion(.failure(.DecodingError))
        }
        completion(.success(decodedData))
    }
    
    func getUsers(completion: @escaping (Result<[UserModel], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json"), let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([UserModel].self, from: data) else {
            return completion(.failure(.DecodingError))
        }
        completion(.success(decodedData))
    }
}
