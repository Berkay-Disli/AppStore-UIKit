//
//  HomeViewController.swift
//  AppStore-UIKit
//
//  Created by Berkay Disli on 19.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let cells: [CellViewModel] = [CellViewModel(posterImageName: "image1", logoImageName: "logo1", footerName: "OUTRIDERS", footerGenre: "Strategy",                                        sectionName: "WORLD PREMIERE", mainTitle: "Fight with your enemies."),
                                          CellViewModel(posterImageName: "image2", logoImageName: "logo2", footerName: "VALORANT", footerGenre: "Shooter", sectionName: "POPULAR", mainTitle: "Express yourself in the war."),
                                          CellViewModel(posterImageName: "image3", logoImageName: "logo3", footerName: "PAPEL", footerGenre: "Action", sectionName: "TOP RATED", mainTitle: "Can you hold your own?"),
                                          CellViewModel(posterImageName: "image4", logoImageName: "logo4", footerName: "BATTLEFIELD", footerGenre: "Shooter", sectionName: "MOST PLAYED", mainTitle: "Help your team to win."),
                                          CellViewModel(posterImageName: "image5", logoImageName: "logo5", footerName: "BLACK OPS", footerGenre: "Shooter", sectionName: "NOSTALGIA", mainTitle: "The numbers, Mason!")
    ]
    
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(HomeFeedTableViewCell.self, forCellReuseIdentifier: HomeFeedTableViewCell.identifier)
        table.register(HomeFeedAlternateTableViewCell.self, forCellReuseIdentifier: HomeFeedAlternateTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Today"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemPink
        
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        homeFeedTable.frame = view.bounds
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    */
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    */
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFeedTableViewCell.identifier, for: indexPath) as? HomeFeedTableViewCell else { return UITableViewCell() }
            
            cell.configure(with: cells[indexPath.row])
        
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFeedAlternateTableViewCell.identifier, for: indexPath) as? HomeFeedAlternateTableViewCell else { return UITableViewCell() }
            
            
            
            
            return cell
        }
        
    }
    
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
}
