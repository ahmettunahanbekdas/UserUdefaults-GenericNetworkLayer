//
//  CharacterModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

// MARK: - Welcome
struct CharacterModel: Codable {
    let info: Info?
    let results: [Character]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
}

// MARK: - Result
struct Character: Codable {
    let id: Int?
    let name: String?
    let gender: Gender?
    let image: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

