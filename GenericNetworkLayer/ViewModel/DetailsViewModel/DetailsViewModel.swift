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
    }
    
    
}
