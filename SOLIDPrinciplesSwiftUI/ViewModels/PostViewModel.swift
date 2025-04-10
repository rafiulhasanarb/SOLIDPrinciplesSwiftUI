//
//  PostViewModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

final class PostViewModel: ObservableObject {
    
    @Published var postList: [PostModel] = []
    
    func fetchPosts() {
        APIService().getPosts { [weak self] comments in
            DispatchQueue.main.async {
                switch comments {
                    case .success(let data):
                    self?.postList = data
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
}
