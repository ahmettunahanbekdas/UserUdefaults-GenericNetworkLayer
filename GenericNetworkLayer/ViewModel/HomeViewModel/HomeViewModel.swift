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
}

extension HomeViewModel: HomeViewDelegate {
    
    func viewDidLoad() {
        view?.configureCollectionView()
    }
    
    
    func configureCollectionView() {
    
    }
    
    
}

