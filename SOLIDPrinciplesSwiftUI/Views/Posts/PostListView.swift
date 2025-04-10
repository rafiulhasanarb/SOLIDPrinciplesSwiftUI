//
//  PostListView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject private var viewModel: PostViewModel = PostViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.postList) { post in
                        NavigationLink {
                            PostDetailView(post: post)
                        } label: {
                            PostRowView(post: post)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.fetchPosts()
            }
            .navigationTitle("Post List")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    PostListView()
}
