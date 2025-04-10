//
//  ContentView.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CommentListView()
                .tabItem {
                    Image(systemName: "command.circle")
                    Text("Comments")
                }
                .tag(0)
            
            PostListView()
                .tabItem {
                    Image(systemName: "cpu")
                    Text("Posts")
                }
                .tag(1)
            
            UserListView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Users")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
