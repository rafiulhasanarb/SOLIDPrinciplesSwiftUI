//
//  PostModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

struct PostModel: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "userId"
        case title
        case body
    }
}
