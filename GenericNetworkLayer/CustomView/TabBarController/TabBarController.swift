//
//  TabBarController.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 24.05.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [createHomeNC(),createFavoritesNC()]
        
    }
    
    func createHomeNC() -> UINavigationController {
        let homeView = HomeView()
        let homeViewModel = HomeViewModel()
        homeView.title = "Home"
        homeView.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        return UINavigationController(rootViewController: homeView)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesView = FavoritesView()
        let favoritesViewModel = FavoritesViewModel()
        favoritesView.title = "Favorites"
        favoritesView.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesView)
    }
    
    
    
    
}

