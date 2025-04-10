//
//  UserModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable, Identifiable {
    let id: Int
    let name, username, email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case username
        case email
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
