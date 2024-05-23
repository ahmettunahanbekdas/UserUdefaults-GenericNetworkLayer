//
//  CharacterDetailsModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation


struct CharacterDetailsModel: Codable {
    var id: Int?
    var name: String?
    var species: String?
    var gender: String?
    var image: String?
}
