//
//  CharacterService.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

protocol CharacterToDetailsServiceDelegate {
    func getCharacter(page: Int, completion: @escaping (Result<CharacterModel, NetworkError>) -> Void)
}

class CharacterToDetailsService: CharacterToDetailsServiceDelegate {
    func getCharacter(page: Int, completion: @escaping (Result<CharacterModel, NetworkError>) -> Void) {
        let endPoint = EndPoint.getCharacter(page: page)
        NetworkManager.shared.request(endPoint, completion: completion)
    }
}
