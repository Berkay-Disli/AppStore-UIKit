//
//  MainTabBarViewController.swift
//  AppStore-UIKit
//
//  Created by Berkay Disli on 19.03.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        overrideUserInterfaceStyle = .dark
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UIViewController())
        let vc3 = UINavigationController(rootViewController: UIViewController())
        let vc4 = UINavigationController(rootViewController: UIViewController())
        let vc5 = UINavigationController(rootViewController: UIViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        vc2.tabBarItem.image = UIImage(systemName: "gamecontroller.fill")
        vc3.tabBarItem.image = UIImage(systemName: "square.stack.3d.up.fill")
        vc4.tabBarItem.image = UIImage(systemName: "r.joystick.fill")
        vc5.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.title = "Today"
        vc2.title = "Games"
        vc3.title = "Apps"
        vc4.title = "Arcade"
        vc5.title = "Search"
        
        tabBar.tintColor = .systemPink
        
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        
    }
    
    
}

