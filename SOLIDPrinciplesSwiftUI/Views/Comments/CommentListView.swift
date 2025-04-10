//
//  CommentListView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import SwiftUI

struct CommentListView: View {
    
    @StateObject private var viewModel: CommentViewModel = CommentViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.commentList) { comment in
                        NavigationLink {
                            CommentDetailView(comment: comment)
                        } label: {
                            CommentRowView(comment: comment)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.fetchComments()
            }
            .navigationTitle("Comment List")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    CommentListView()
}
