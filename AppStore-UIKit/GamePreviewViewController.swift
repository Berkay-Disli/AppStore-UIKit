//
//  GamePreviewViewController.swift
//  AppStore-UIKit
//
//  Created by Berkay Disli on 19.03.2023.
//

import UIKit

class GamePreviewViewController: UIViewController {
    
    private var cell: CellViewModel? = nil
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let footerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let footerGenreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .systemPink
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = cell?.footerName ?? "No name!"
        //navigationController?.navigationBar.prefersLargeTitles = false
        
        // MARK: for subsequent view controllers to never use large titles:
        navigationItem.largeTitleDisplayMode = .never
        
        
        view.addSubview(posterImageView)
        view.addSubview(logoImageView)
        view.addSubview(footerNameLabel)
        view.addSubview(footerGenreLabel)
        view.addSubview(mainTitleLabel)
        
        
        applyConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public func configure(with model: CellViewModel) {
        self.cell = model
        
        self.posterImageView.image = UIImage(named: model.posterImageName)
        self.logoImageView.image = UIImage(named: model.logoImageName)
        self.footerNameLabel.text = model.footerName
        self.footerGenreLabel.text = model.footerGenre
        self.mainTitleLabel.text = model.mainTitle
    }
    
    private func applyConstraints() {
        let constraints = [
            posterImageView.heightAnchor.constraint(equalToConstant: 500),
            posterImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            footerNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            footerNameLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor),
            footerNameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            footerGenreLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            footerGenreLabel.topAnchor.constraint(equalTo: footerNameLabel.bottomAnchor, constant: 0),
            
            mainTitleLabel.topAnchor.constraint(equalTo: footerGenreLabel.bottomAnchor),
            mainTitleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            mainTitleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
 
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
