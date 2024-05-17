//
//  CharacterModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

struct CharacterModel: Codable {
    let info: Info?
    let results: [Results]?
}

struct Info: Codable {
    let page: Int?
}

struct Results: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let gender: Gender?
}

enum Gender: String, Codable {
    case female = "Female"
    case genderless = "Genderless"
    case male = "Male"
    case unknown = "unknown"
}
