//
//  HomeFeedTableViewCell.swift
//  AppStore-UIKit
//
//  Created by Berkay Disli on 19.03.2023.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {
    static let identifier = "HomeFeedTableViewCell"
    
    private let footerView: UIView = {
       let footerView = UIView()
        footerView.backgroundColor = .systemGray6
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //imageView.image = UIImage(named: "logo1")
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let footerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        //label.text = "OUTRIDERS"
        label.textColor = .white
        return label
    }()
    
    private let footerGenreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        //label.text = "Action"
        label.textColor = .gray
        return label
    }()
    
    private let buyInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 9, weight: .semibold)
        label.text = "In app purchases"
        label.textColor = .gray
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DOWNLOAD", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //-----------------------------------------------
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //imageView.image = UIImage(named: "image1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        //label.text = "WORLD PREMIERE"
        label.textColor = .white
        return label
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        //label.text = "Fight with dangerous enemies"
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    //-----------------
    
    private let spacingViewTop: UIView = {
       let footerView = UIView()
        footerView.backgroundColor = .systemBackground
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()
    
    private let spacingViewBottom: UIView = {
       let footerView = UIView()
        footerView.backgroundColor = .systemBackground
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(sectionNameLabel)
        contentView.addSubview(mainTitleLabel)
        contentView.addSubview(footerView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(footerNameLabel)
        contentView.addSubview(footerGenreLabel)
        contentView.addSubview(buyInfoLabel)
        contentView.addSubview(downloadButton)
        
        applyConstraints()
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        //posterImageView.frame = contentView.bounds
    }
    
    private func applyConstraints() {
        let constraints = [
            posterImageView.heightAnchor.constraint(equalToConstant: 400),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            sectionNameLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor, constant: 25),
            sectionNameLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: 20),
            
            mainTitleLabel.topAnchor.constraint(equalTo: sectionNameLabel.topAnchor, constant: 30),
            mainTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainTitleLabel.widthAnchor.constraint(equalToConstant: 280),
            
            footerView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 85),
            footerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            logoImageView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -15),
            logoImageView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            
            footerNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            footerNameLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: -12),
            
            footerGenreLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            footerGenreLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 8),
            
            downloadButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            downloadButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -15),
            
            buyInfoLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 0),
            //buyInfoLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -20),
            buyInfoLabel.widthAnchor.constraint(equalToConstant: 50),
            buyInfoLabel.centerXAnchor.constraint(equalTo: downloadButton.centerXAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    public func configure(with model: CellViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.posterImageView.image = UIImage(named: model.posterImageName)
            self?.logoImageView.image = UIImage(named: model.logoImageName)
            self?.footerNameLabel.text = model.footerName
            self?.footerGenreLabel.text = model.footerGenre
            self?.sectionNameLabel.text = model.sectionName
            self?.mainTitleLabel.text = model.mainTitle
        }
        
    }
}
