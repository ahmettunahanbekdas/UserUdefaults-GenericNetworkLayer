//
//  HomeViewModel.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import Foundation

protocol HomeViewModelDelegate {
    var view: HomeViewDelegate? { get set }
    func viewDidLoad()
}

final class HomeViewModel {
    weak var view: HomeViewDelegate?
    var characters: [Character] = []
    var error: Error?
    private let service = CharacterService()
    private let detailService = CharacterDetailsService()
    private var page = 1
}

extension HomeViewModel: HomeViewModelDelegate {
    func viewDidLoad() {
        view?.configureCollectionView()
        view?.setupNavigationBar()
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
                if page == 7 {
                    page = 9
                }
                page += 1
            case .failure(let error):
                self.error = error
                print(error.localizedDescription)
            }
        }
    }
    
    func didSelectedCharacter(id: Int) {
        detailService.getCharacterDetails(id: id) { [weak self] returnedCharacter in
            guard let self = self else {
                return
            }
            switch returnedCharacter {
            case .success(let characterDetails):
                self.view?.toDetailsView(character: characterDetails)
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
