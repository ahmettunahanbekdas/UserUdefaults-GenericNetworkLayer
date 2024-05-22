//
//  HomeViewModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

protocol HomeViewModelDelegate {
    var view: HomeViewDelegate? { get set }
}

final class HomeViewModel {
    weak var view: HomeViewDelegate?
    var characters: [Character] = []
    var error: Error?
    private let service = CharacterService()
    private var page = 1
}

extension HomeViewModel: HomeViewModelDelegate {
    func viewDidLoad() {
        view?.configureCollectionView()
        getCharacter()
    }
    
    func getCharacter() {
        service.getCharacter(page: page) { [weak self] result in
            guard let self = self else {
                print("Self Error")
                return
            }
            switch result {
            case .success(let character):
                self.characters.append(contentsOf: character.results!)
                view?.reloadData()
            case .failure(let error):
                self.error = error
                print(error.localizedDescription)
            }
        }
    }
}
