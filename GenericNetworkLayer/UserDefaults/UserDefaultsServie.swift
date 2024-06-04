//
//  UserDefaultsService.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 24.05.2024.
//

import Foundation

enum ActionType {
    case add
    case remove
}

enum UserDefaultsService {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    // Favorileri kaydeden ve hata durumlarını yöneten özel bir fonksiyon.
    static private func saveFavorites(favorites: [CombinedCharacter]) -> CharacterError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .alreadyInFavorites
        }
    }
    
    static func getFavorites(completion: @escaping (Result<[CombinedCharacter], Error>) -> Void) {
        if let favoritesData = defaults.data(forKey: Keys.favorites) {
            do {
                let decoder = JSONDecoder()
                let favorites = try decoder.decode([CombinedCharacter].self, from: favoritesData)
                completion(.success(favorites))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error)) // Favorileri alırken bir hata olursa belirtilen hatayı döndürür.
            }
        } else {
            print("No data found for key \(Keys.favorites)")
            completion(.success([])) // Favorileri alamazsa boş bir liste döndürür.
        }
    }
    
    static func updateFavorites(favorite: CombinedCharacter, actionType: ActionType, completion: @escaping (CharacterError?) -> ()) {
        getFavorites { result in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        print("Character already in favorites")
                        return
                    }
                    print("Character added in favorites")
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.name == favorite.name }
                }
                completion(saveFavorites(favorites: favorites))
            case .failure(let error):
                completion(.unableToFavorite)
            }
        }
    }
    
   

}
