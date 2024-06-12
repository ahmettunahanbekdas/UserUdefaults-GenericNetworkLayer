//
//  CharacterToDetailsService.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

protocol CharacterDetailsServiceDelegate {
    func getCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetailsModel, NetworkError>) -> Void)
}

class CharacterDetailsService: CharacterDetailsServiceDelegate {
    func getCharacterDetails(id: Int, completion: @escaping (Result <CharacterDetailsModel, NetworkError>) -> Void) {
        let endPoint = EndPoint.detailToCharacter(id: id)
        NetworkManager.shared.request(endPoint, completion: completion)
    }
}
