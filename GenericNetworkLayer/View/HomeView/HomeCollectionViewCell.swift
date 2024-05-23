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
        imageView.layer.cornerRadius = CGFloat.dWith / 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.text = "wss"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCell()
    }
    
    func configure(with model: Character) {
        let characterPath = model.image
        guard let url = URL(string: characterPath!) else {
            return
        }
        characterImageView.sd_setImage(with: url)
        
        let characterLabel = model.name
        characterNameLabel.text = characterLabel
    }
    
    
    func configureCell() {
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWith / 30),
            characterImageView.widthAnchor.constraint(equalToConstant: CGFloat.dWith / 3),
            characterImageView.heightAnchor.constraint(equalToConstant: CGFloat.dWith / 3),
            
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: CGFloat.dWith / 15),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWith / 15),
            characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

