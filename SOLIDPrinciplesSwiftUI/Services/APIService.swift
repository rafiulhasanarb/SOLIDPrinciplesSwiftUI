//
//  APIService.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

class APIService: APIServiceProtocol, APIServiceDelegate {
    //MARK: - open closed applyed
    func getCommentList(completion: @escaping (Result<[CommentModel], CustomError>) -> Void) {
        guard let url = URL(string: AppConstant.commentURL) else { return completion(.failure(.BadURL)) }
        NetworkManager().fetchReqeust(url: url, type: [CommentModel].self, completion: completion)
    }
    
    func getUserList(completion: @escaping (Result<[UserModel], CustomError>) -> Void) {
        guard let url = URL(string: AppConstant.userURL) else { return completion(.failure(.BadURL)) }
        NetworkManager().fetchReqeust(url: url, type: [UserModel].self, completion: completion)
    }
    
    func getPostList(completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        guard let url = URL(string: AppConstant.postURL) else { return completion(.failure(.BadURL)) }
        NetworkManager().fetchReqeust(url: url, type: [PostModel].self, completion: completion)
    }
    
    // MARK: - general methods
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
