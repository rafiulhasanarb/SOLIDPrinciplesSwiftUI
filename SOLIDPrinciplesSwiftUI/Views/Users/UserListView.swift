//
//  UserListView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel: UserViewModel = UserViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.userList) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.fetchUsers()
            }
            .navigationTitle("User List")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    UserListView()
}
