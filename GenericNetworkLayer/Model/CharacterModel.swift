//
//  CharacterModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

struct CharacterModel: Codable{
    let info: Info?
    let results: [Character]?
}

struct Info: Codable {
    let count, pages: Int?
    let next: String?
}

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

