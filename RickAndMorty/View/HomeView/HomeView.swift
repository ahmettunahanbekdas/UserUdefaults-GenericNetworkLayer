//
//  ViewController.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func configureCollectionView()
    func reloadData()
    func toDetailsView(character: CharacterDetailsModel)
}

class HomeView: UIViewController {
    lazy var viewModel = HomeViewModel()
    private var characterCollectionView: UICollectionView!
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        reloadData()
    }
}

extension HomeView: HomeViewDelegate {
    func configureCollectionView() {
        characterCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CollectionViewHelper.collectionViewFlowLayout())
        characterCollectionView.backgroundColor = .systemBackground
        characterCollectionView.isScrollEnabled = true
        characterCollectionView.dataSource = self
        characterCollectionView.delegate = self
        characterCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        view.addSubview(characterCollectionView)
    }
    
    func reloadData() {
           characterCollectionView.reloadData()
       }
    
    func toDetailsView(character: CharacterDetailsModel ) {
        DispatchQueue.main.async {
            let detailsView = DetailsView(character: character)
            self.navigationController?.pushViewController(detailsView, animated: true)
        }
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        let character = viewModel.characters[indexPath.item]
        cell.setCharacter(with: character)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.characters.count - 1 {
            self.viewModel.getCharacter()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let didSelectedCharacter = viewModel.characters[indexPath.item].id
        
        guard let didSelectedCharacter = didSelectedCharacter else {
            printContent("didSelectedCharacter Error")
            return
        }
        viewModel.didSelectedCharacter(id: didSelectedCharacter)
    }
}
