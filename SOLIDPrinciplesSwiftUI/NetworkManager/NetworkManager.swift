//
//  NetworkManager.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

enum CustomError: Error {
    case BadURL
    case NoData
    case DecodingError
}


class NetworkManager {
    
    func getComments(completion: @escaping (Result<[CommentModel], CustomError>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            completion(.failure(.BadURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return completion(.failure(.NoData))
            }
            let commentResponse = try? JSONDecoder().decode([CommentModel].self, from: data)
            if let commentResponse = commentResponse {
                completion(.success(commentResponse))
            } else {
                completion(.failure(.DecodingError))
            }
        }
        .resume()
    }
    
    func getPosts(completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(.failure(.BadURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return completion(.failure(.NoData))
            }
            let postResponse = try? JSONDecoder().decode([PostModel].self, from: data)
            if let postResponse = postResponse {
                completion(.success(postResponse))
            } else {
                completion(.failure(.DecodingError))
            }
        }.resume()
    }
    
    func getUsers(completion: @escaping (Result<[UserModel], CustomError>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(.BadURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return completion(.failure(.NoData))
            }
            let userResponse = try? JSONDecoder().decode([UserModel].self, from: data)
            if let userResponse = userResponse {
                completion(.success(userResponse))
            } else {
                completion(.failure(.DecodingError))
            }
        }.resume()
    }
}
