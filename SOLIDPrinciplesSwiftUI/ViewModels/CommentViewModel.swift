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
    private var databaseHandler: APIServiceDelegate
    
    init(apiService: APIServiceDelegate = APIService(), databaseHandler: APIServiceDelegate = LocalDatabaseHandler()) {
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
            databaseHandler.getComments { [weak self] comments in
                DispatchQueue.main.async {
                    switch comments {
                    case .success(let data):
                        self?.commentList = data
                    case .failure(let error):
                        print("Error: \(error)")
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
        return false
    }
}

