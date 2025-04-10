//
//  UserDetailView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import SwiftUI

struct UserDetailView: View {
    
    @State var user: UserModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(user.name)
                .font(.headline)
            
            Text(user.username)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text(user.email)
                .font(.body)
                .foregroundStyle(.teal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        Spacer()
    }
}

#Preview {
    UserDetailView(user: UserModel(id: 1, name: "Rafiul Hasan", username: "rafiulhasan", email: "rafiulhasan@gmail.com"))
}
