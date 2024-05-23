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
}
