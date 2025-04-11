//
//  CommentViewModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

final class CommentViewModel: ObservableObject {
    
    @Published var commentList: [CommentModel] = []
    
    private var apiService: APIServiceDelegate
    private var databaseHandler: APIServiceProtocol
    
    init(apiService: APIServiceDelegate = APIService(), databaseHandler: APIServiceProtocol = LocalDatabaseHandler()) {
        self.apiService = apiService
        self.databaseHandler = databaseHandler
    }
    
    func fetchComments() {
        if isConnectedToNetwork() {
            apiService.getComments { [weak self] comments in
                DispatchQueue.main.async {
                    switch comments {
                    case .success(let data):
                        self?.commentList = data
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
            }
        } else {
            databaseHandler.getCommentList { commentResult in
                DispatchQueue.main.async {
                    switch commentResult {
                        case .success(let data):
                        self.commentList = data
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
        /*
        APIService().getComments { [weak self] comments in
            DispatchQueue.main.async {
                switch comments {
                    case .success(let data):
                    self?.commentList = data
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
        */
    }
    
    
    private func isConnectedToNetwork() -> Bool {
        return true
    }
}

