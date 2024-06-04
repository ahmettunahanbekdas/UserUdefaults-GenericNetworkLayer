//
//  FavoritesViewModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 24.05.2024.
//

import Foundation


protocol FavoritesViewModelDelegate {
    var view: FavoritesViewDelegate? { get set }
    func viewDidLoad()
    func viewWillAppear()
}

 class FavoritesViewModel {
     weak var view: FavoritesViewDelegate?
     var favoriteCharacter: [CombinedCharacter] = []
}


extension FavoritesViewModel: FavoritesViewModelDelegate {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        
    }
    
    func viewWillAppear() {
        getFavoriteCharacters()
    }
    
    func getFavoriteCharacters() {
        UserDefaultsService.getFavorites { [weak self] result in
            guard let self = self else {
                print("self Error")
                return
            }
            switch result {
            case .success(let characters):
                self.favoriteCharacter = characters
                self.view?.reloadCollectionViewOnMainThread()
            case .failure(_):
                print("Error")
            }
        }
    }
    
    func deleteFavoriteCharacter(_ character: CombinedCharacter) {
        
    }
}
