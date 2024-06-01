//
//  CollectionViewHelper.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import UIKit

enum CollectionViewHelper {
    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 6)
        layout.minimumLineSpacing = UIScreen.main.bounds.width / 30
        return layout
    }
    
    
    
    static func createFavoritesFlowLayout() -> UICollectionViewFlowLayout {
        let screenWidth = CGFloat.dWith
        let padding: CGFloat = 16
        let minimumItemSpacing: CGFloat = 12
        let availableWidth = screenWidth - (2 * padding) - minimumItemSpacing
        let itemWidth = availableWidth / 2

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth )

        return layout
    }
}

