//
//  HomeCollectionViewCell.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 17.05.2024.
//

import UIKit
import SDWebImage

final class HomeCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = CGFloat.dWith / 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var characterNameLabel: CharacterTitleLabel = {
        let label = CharacterTitleLabel(fontSize: CGFloat.dWith / 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureImageView()
        configureLabel()
        configureCell()
        
    }
    
    func setCharacter(with model: Character) {
        DispatchQueue.main.async {
            guard let characterImage = model.image else {
                print("characterImage Error")
                return
            }

            guard let url = URL(string: characterImage) else {
                print("url Error")
                return
            }
            self.characterImageView.sd_setImage(with: url)
            
            let characterLabel = model.name
            self.characterNameLabel.text = characterLabel
        }
      
    }
    
    func configureImageView() {
        contentView.addSubview(characterImageView)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWith / 30),
            characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: CGFloat.dWith / 3),
            characterImageView.heightAnchor.constraint(equalToConstant: CGFloat.dWith / 3),
        ])
    }
    
    func configureLabel() {
        contentView.addSubview(characterNameLabel)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: CGFloat.dWith / 15),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWith / 15),
            characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureCell() {
        layer.borderWidth = CGFloat.dWith / 100
        layer.borderColor = UIColor.label.cgColor
        layer.cornerRadius = CGFloat.dWith / 20
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

