//
//  UserViewModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

final class UserViewModel: ObservableObject {
    
    @Published var userList: [UserModel] = []
    
    func fetchUsers() {
        APIService().getUsers { [weak self] comments in
            DispatchQueue.main.async {
                switch comments {
                    case .success(let data):
                    self?.userList = data
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
}
