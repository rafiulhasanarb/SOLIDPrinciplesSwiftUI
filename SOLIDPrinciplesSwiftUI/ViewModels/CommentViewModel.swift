//
//  CommentViewModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

final class CommentViewModel: ObservableObject {
    
    @Published var commentList: [CommentModel] = []
    
    func fetchComments() {
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
    }   
    
}

