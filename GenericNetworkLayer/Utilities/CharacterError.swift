//
//  CharacterError.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 24.05.2024.
//

import Foundation

enum CharacterError: String, Error {
    case unableToFavorite = "There was an error favoriting this pokemon. Please try again."
    case alreadyInFavorites = "You've already favorited this pokemon. You must really like them!"
}
