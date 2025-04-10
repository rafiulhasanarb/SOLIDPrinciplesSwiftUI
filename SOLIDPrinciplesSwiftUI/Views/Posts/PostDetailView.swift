//
//  PostDetailView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import SwiftUI

struct PostDetailView: View {
    
    var post: PostModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(post.title)
                .font(.headline)
            
            Text(post.body)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .padding(.horizontal)
        //.background(Color.gray.opacity(0.1))
        //.cornerRadius(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
    }
}

#Preview {
    PostDetailView(post: PostModel(id: 1, userId: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"))
}
