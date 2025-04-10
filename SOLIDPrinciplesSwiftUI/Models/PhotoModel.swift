//
//  PhotoModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

struct PhotoModel: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case url
        case thumbnailUrl = "thumbnailUrl"
    }
}
