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
}

class HomeView: UIViewController {
    private var characterCollectionView: UICollectionView!
    lazy var viewModel = HomeViewModel()
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
        characterCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        view.addSubview(characterCollectionView)
    }
    func reloadData() {
           characterCollectionView.reloadData()
       }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        let character = viewModel.characters[indexPath.item]
        cell.configure(with: character)
        return cell
    }
    
  //  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
  //      if indexPath.row == self.viewModel.characters.count - 1 {
  //          self.viewModel.getCharacter()
  //      }
  //  }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y //Scroll değerimiz
        let contentHeight = scrollView.contentSize.height //Tüm scroll uzunluğu
        let height = characterCollectionView.frame.height // CollectionView uzunluğu
        
        guard  contentHeight != 0 else {return}
        if offSetY >= contentHeight - (2 * height) {
            viewModel.getCharacter()
        }
    }
}





