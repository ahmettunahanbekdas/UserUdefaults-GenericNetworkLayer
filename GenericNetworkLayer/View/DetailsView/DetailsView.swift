//
//  DetailsView.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 23.05.2024.
//

import UIKit

protocol DetailsViewDelegate: AnyObject {
    func configureNameLabel()
    func configureImageView(with character: CharacterDetailsModel)
    func configureSpeciesLabel()
    func configureStatusLabel()
    func configureGenderLabel()
    func configureFavoritesButton()
}

class DetailsView: UIViewController {
    lazy var viewModel = DetailsViewModel(character: character!)
    private let character: CharacterDetailsModel?
    
    init(character: CharacterDetailsModel){
        self.character = character
        super.init(nibName: nil, bundle: nil)
        print("Detail Screen Init")
    }
    deinit {
        print("Detail Screen Deinit")
    }
    
    private lazy var characterImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = CGFloat.dWith / 8
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var characterNameLabel: CharacterTitleLabel = {
        let label = CharacterTitleLabel(fontSize: CGFloat.dWith / 15)
        return label
    }()
    
    
    private lazy var characterSpeciesLabel: CharacterTitleLabel = {
        let label = CharacterTitleLabel(fontSize: CGFloat.dWith / 20)
        return label
    }()
    
    private lazy var characterStatusLabel: CharacterTitleLabel = {
        let label = CharacterTitleLabel(fontSize: CGFloat.dWith / 20)
        return label
    }()
    
    private lazy var characterGenderLabel: CharacterTitleLabel = {
        let label = CharacterTitleLabel(fontSize: CGFloat.dWith / 20)
        return label
    }()
    
    private lazy var favoritesButton: UIBarButtonItem = {
        let favoriteButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favoriteButtonTapped))
        return favoriteButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsView: DetailsViewDelegate {
    
    
    
    func configureImageView(with character: CharacterDetailsModel) {
        view.addSubview(characterImageView)
        guard let characterImage = character.image else {
            print("characterImage Error")
            return
        }
        guard let url = URL(string: characterImage) else {
            return
        }
        characterImageView.sd_setImage(with: url)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat.dWith / 20),
            characterImageView.widthAnchor.constraint(equalToConstant: CGFloat.dWith / 2),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor)
        ])
    }
    
    func configureNameLabel() {
        view.addSubview(characterNameLabel)
        let nameLabel = character?.name
        characterNameLabel.text = nameLabel
        characterNameLabel.textAlignment = .center
        characterNameLabel.numberOfLines = 0
        
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: CGFloat.dWith / 20),
            characterNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWith / 40),
            characterNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.dWith / 40)
        ])
    }
    
    func configureSpeciesLabel() {
        view.addSubview(characterSpeciesLabel)
        guard let speciesLabel = character?.species else {
            print("speciesLabel Error")
            return
        }
        characterSpeciesLabel.text = "Species: \(speciesLabel)"
        
        characterSpeciesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterSpeciesLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: CGFloat.dWith / 2),
            characterSpeciesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWith / 40),
            characterSpeciesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.dWith / 40)
        ])
    }
    
    func configureStatusLabel() {
        view.addSubview(characterStatusLabel)
        guard let statusLabel = character?.status else {
            print("speciesLabel Error")
            return
        }
        characterStatusLabel.text = "Status: \(statusLabel)"
        
        characterStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterStatusLabel.topAnchor.constraint(equalTo: characterSpeciesLabel.bottomAnchor, constant: CGFloat.dWith / 40),
            characterStatusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWith / 40),
            characterStatusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.dWith / 40)
        ])
    }
    
    func configureGenderLabel() {
        view.addSubview(characterGenderLabel)
        guard let genderLabel = character?.status else {
            print("speciesLabel Error")
            return
        }
        characterGenderLabel.text = "Status: \(genderLabel)"
        
        characterGenderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterGenderLabel.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: CGFloat.dWith / 40),
            characterGenderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWith / 40),
            characterGenderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.dWith / 40)
        ])
    }
    
    func configureFavoritesButton() {
        navigationItem.rightBarButtonItem = self.favoritesButton
    }
    
    @objc func favoriteButtonTapped() {
        viewModel.addFavorites()
        print("Tapped favorites button")
    }
    
}
