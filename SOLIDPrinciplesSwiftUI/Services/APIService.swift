//
//  APIService.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

class APIService {
    func getComments(completion: @escaping (Result<[CommentModel], CustomError>) -> Void)  {
        NetworkManager().getComments(completion: completion)
    }
    
    func getPosts(completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        NetworkManager().getPosts(completion: completion)
    }
    
    func getUsers(completion: @escaping (Result<[UserModel], CustomError>) -> Void) {
        NetworkManager().getUsers(completion: completion)
    }
}
