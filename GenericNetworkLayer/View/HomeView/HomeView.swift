//
//  ViewController.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func configureCollectionView()
}

class HomeView: UIViewController {
    private var characterCollectionView: UICollectionView!
    lazy var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeView: HomeViewDelegate {
    func configureCollectionView() {
        characterCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CollectionViewHelper.collectionViewFlowLayout())
        characterCollectionView.backgroundColor = .systemBackground
        characterCollectionView.isScrollEnabled = true
        characterCollectionView.dataSource = self
        characterCollectionView.delegate = self
        characterCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        view.addSubview(characterCollectionView)
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath)
        cell.backgroundColor = .label
        return cell
    }
}





