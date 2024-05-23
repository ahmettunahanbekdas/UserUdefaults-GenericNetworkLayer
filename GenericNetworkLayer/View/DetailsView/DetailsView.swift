//
//  DetailsView.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 23.05.2024.
//

import UIKit

protocol DetailsViewDelegate: AnyObject {
    func configureNameLabel()
    func  configureImageView(with character: CharacterDetailsModel)
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
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var characterImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = CGFloat.dWith / 8
        image.clipsToBounds = true
        return image
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
        NSLayoutConstraint.activate(([
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat.dWith / 20)
        ]))
    }
    
    func configureNameLabel() {
        view.addSubview(characterNameLabel)
        let nameLabel = character?.name
        characterNameLabel.text = nameLabel
        
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(([
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: CGFloat.dWith / 20),
            characterNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]))
    }
}
