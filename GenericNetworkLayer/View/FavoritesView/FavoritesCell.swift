//
//  FavoritesCollectionViewCell.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 28.05.2024.
//

import UIKit
import SDWebImage

protocol FavoritesCellDelegate: AnyObject {
    func didTapDeleteButton(selectedForDelete: CombinedCharacter)
}

class FavoritesCell: UICollectionViewCell {
    static let identifier = "favortiteCell"
    private var favoriteCharacter: CombinedCharacter?
    weak var delegate: FavoritesCellDelegate?
    
    
    let characterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
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
    }
    
    func setCell(character: CombinedCharacter) {
        self.favoriteCharacter = character
        DispatchQueue.main.async {
            self.characterLabel.text = character.name
            self.characterImageView.backgroundColor = .label
            
            guard let url = URL(string: character.image ?? "") else {
                print("URL Error")
                return
            }
            self.characterImageView.sd_setImage(with: url)
            
        }
    }
    
    private func configureCell() {
        let padding: CGFloat = 8
        
        addSubview(characterImageView)
        addSubview(characterLabel)
        addSubview(unfavoriteButton)
        
        characterLabel.textAlignment = .center
        layer.borderColor = UIColor.label.cgColor
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
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: characterLabel.topAnchor, constant: -padding),
            
            characterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            characterLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            characterLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            characterLabel.heightAnchor.constraint(equalToConstant: 28),
            
            unfavoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            unfavoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            unfavoriteButton.widthAnchor.constraint(equalToConstant: 30),
            unfavoriteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    @objc func deleteButtonTapped() {
        guard let selectedForDelete = favoriteCharacter else {
            print("selecteForDelete Error")
            return
        }
        delegate?.didTapDeleteButton(selectedForDelete: selectedForDelete)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


