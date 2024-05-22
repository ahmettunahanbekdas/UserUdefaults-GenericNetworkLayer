//
//  HomeCollectionViewCell.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import UIKit
import SDWebImage

final class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(characterImageView)
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImageView.frame = contentView.bounds
    }
    
    func configure(with model: Character) {
        let characterPath = model.image
        guard let url = URL(string: characterPath!) else {
            return
        }
        characterImageView.sd_setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

