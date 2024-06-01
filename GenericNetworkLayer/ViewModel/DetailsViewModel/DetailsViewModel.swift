//
//  DetailsViewModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 23.05.2024.
//

import Foundation
import SDWebImage


protocol DetailsViewModelDelegate {
    var view: DetailsViewDelegate? { get set }
    func viewDidLoad()
    func addFavorites()
}

class DetailsViewModel {
    weak var view: DetailsViewDelegate?
    private let character: CharacterDetailsModel

       init(character: CharacterDetailsModel) {
           self.character = character
       }
}

extension DetailsViewModel: DetailsViewModelDelegate {
    func viewDidLoad() {
        view?.configureImageView(with: character)
        view?.configureNameLabel()
        view?.configureSpeciesLabel()
        view?.configureStatusLabel()
        view?.configureGenderLabel()
        view?.configureFavoritesButton()
        printFavorites()
    }
    
    func addFavorites() {
        let selectedCharacter = CombinedCharacter(id: character.id, name: character.name, image: character.image)
        
        UserDefaultsService.updateFavorites(favorite: selectedCharacter, actionType: .add) { [weak self] error in
            guard self != nil else { return }
            guard let error = error else {
                DispatchQueue.main.async {
                    print("Success")
                }
                return
            }
            DispatchQueue.main.async {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func printFavorites() {
        UserDefaultsService.getFavorites { result in
            switch result {
            case .success(let favorites):
                print("Favorites: \(favorites.count)")
            case .failure(let error):
                print("Failed to get favorites: \(error.localizedDescription)")
            }
        }
    }
}
