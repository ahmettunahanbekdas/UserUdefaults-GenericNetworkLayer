//
//  FavoritesCollectionViewCell.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 28.05.2024.
//

import UIKit
import SDWebImage

protocol FavoriteCellDelegate {
    
}

class FavoritesCollectionViewCell: UICollectionViewCell {
    static let identifier = "favortiteCell"
    
    let characterImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let characterLabel: CharacterTitleLabel = {
        let label = CharacterTitleLabel(fontSize: 20)
        return label
    }()
    
    let unfavoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        setCell()
    }
    
    func setCell() {
        characterLabel.text = "model.name"
        characterImageView.backgroundColor = .label
    }
    
    private func configureCell() {
        let padding: CGFloat = 8
        
        addSubview(characterImageView)
        addSubview(characterLabel)
        addSubview(unfavoriteButton)

        
        characterLabel.textAlignment = .center
        
        layer.cornerRadius = CGFloat.dWith / 20
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.borderWidth = 2
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .large)
        let deleteTrash = UIImage(systemName: "trash.circle", withConfiguration: largeConfig)
        unfavoriteButton.setImage(deleteTrash, for: .normal)
        unfavoriteButton.tintColor = .systemRed
        unfavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        unfavoriteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        unfavoriteButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2 * padding),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            characterLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            characterLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4 * padding),
            characterLabel.heightAnchor.constraint(equalToConstant: 28),
            
            unfavoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            unfavoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            unfavoriteButton.widthAnchor.constraint(equalToConstant: 30),
            unfavoriteButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    
    @objc func deleteButtonTapped() {
        print("Delete")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


