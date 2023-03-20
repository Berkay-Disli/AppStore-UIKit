//
//  HomeFeedAlternateTableViewCell.swift
//  AppStore-UIKit
//
//  Created by Berkay Disli on 20.03.2023.
//

import UIKit

class HomeFeedAlternateTableViewCell: UITableViewCell {

    static let identifier = "HomeFeedAlternateTableViewCell"
    
    
    private let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.itemSize = CGSize(width: 144, height: 200)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private let containerView: UIView = {
       let footerView = UIView()
        footerView.backgroundColor = .systemGray6
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()
    
    private let containerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.text = "Popular iPhone apps of the week"
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let containerSectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "FAVOURITES"
        label.textColor = .gray
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(containerView)
        contentView.addSubview(containerSectionLabel)
        contentView.addSubview(containerNameLabel)
        contentView.addSubview(appsCollectionView)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        applyConstraints()
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        //containerView.frame = contentView.bounds
    }
    
    private func applyConstraints() {
        let constraints = [
            containerView.heightAnchor.constraint(equalToConstant: 400),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            containerSectionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            containerSectionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            //containerSectionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            containerNameLabel.topAnchor.constraint(equalTo: containerSectionLabel.bottomAnchor, constant: 10),
            containerNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            containerNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            
            appsCollectionView.topAnchor.constraint(equalTo: containerNameLabel.bottomAnchor, constant: 10),
            appsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            appsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /*
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
     */

}

/*
extension HomeFeedAlternateTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFeedTableViewCell.identifier, for: indexPath) as? HomeFeedTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: cells[indexPath.row])
    */
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Ahahah"
        return cell
        
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
     
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 20

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
     
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = GamePreviewViewController()
        let model = cells[indexPath.row]
        vc.configure(with: model)
        navigationController?.pushViewController(vc, animated: true)
    }
     */
}
*/

extension HomeFeedAlternateTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /*
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        
        guard let posterImage = titles[indexPath.row].posterPath else { return UICollectionViewCell() }
        cell.configure(with: posterImage)
         */
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
}
