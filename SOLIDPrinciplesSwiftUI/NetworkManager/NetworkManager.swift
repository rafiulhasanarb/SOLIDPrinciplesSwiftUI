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
    
    let apiHandler: APIHandler
    let responseHandler: ResponseHandler
    
    init(apiHandler: APIHandler = APIHandler(), responseHandler: ResponseHandler = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func getComments(completion: @escaping (Result<[CommentModel], CustomError>) -> Void) {
        
        guard let url = URL(string: AppConstant.commentURL) else {
            completion(.failure(.BadURL))
            return
        }
        
        apiHandler.getCommentData(url: url) { data in
            switch data {
            case .success(let data):
                self.responseHandler.getCommentDecodedData(from: data) { result in
                    switch result {
                    case .success(let commentResponse):
                        completion(.success(commentResponse))
                    case .failure:
                        completion(.failure(.DecodingError))
                    }
                }
            case .failure:
                completion(.failure(.NoData))
            }
        }
    }
    
    func getPosts(completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        
        guard let url = URL(string: AppConstant.postURL) else {
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
        
        guard let url = URL(string: AppConstant.userURL) else {
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

class APIHandler {
    
    func getCommentData(url: URL, completion: @escaping (Result<Data, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completion(.failure(.BadURL))
                return
            }
            guard let data = data else {
                completion(.failure(.NoData))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
    func getPostData(url: URL, completion: @escaping (Result<Data, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completion(.failure(.BadURL))
                return
            }
            
            guard let data = data else {
                completion(.failure(.NoData))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
    func getUserData(url: URL, completion: @escaping (Result<Data, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completion(.failure(.BadURL))
                return
            }
            
            guard let data = data else {
                completion(.failure(.NoData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

class ResponseHandler {
    
    func getCommentDecodedData(from data: Data, completion: @escaping (Result<[CommentModel], CustomError>) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let commentModel = try decoder.decode([CommentModel].self, from: data)
            completion(.success(commentModel))
        } catch {
            completion(.failure(.DecodingError))
        }
    }
    
    func getPostDecodedData(from data: Data, completion: @escaping (Result<[PostModel], CustomError>) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let postModel = try decoder.decode([PostModel].self, from: data)
            completion(.success(postModel))
        } catch {
            completion(.failure(.DecodingError))
        }
    }
    
    func getUserDecodedData(from data: Data, completion: @escaping (Result<[UserModel], CustomError>) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let userModel = try decoder.decode([UserModel].self, from: data)
            completion(.success(userModel))
        } catch {
            completion(.failure(.DecodingError))
        }
    }
}
