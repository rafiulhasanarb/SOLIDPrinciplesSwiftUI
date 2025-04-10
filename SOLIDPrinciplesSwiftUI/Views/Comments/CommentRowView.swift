//
//  CommentRowView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import SwiftUI

struct CommentRowView: View {
    
    var comment: CommentModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(comment.name)
                .font(.headline)
            
            Text(comment.email)
                .font(.subheadline)
            
        }
        //.padding()
        //.background(Color.gray.opacity(0.1))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CommentRowView(comment: CommentModel(id: 1, postId: 1, name: "id labore ex et quam laborum", email: "Eliseo@gardner.biz", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"))
}
