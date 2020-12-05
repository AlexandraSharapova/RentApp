//
//  MainTabBarController.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Main Views
        
        let searchVC = SearchViewController()
        let savesVC = SavesViewController()
        let travelVC = TravelViewController()
        let messengerVC = ObserveChatsViewController()
        let navigationChats = UINavigationController(rootViewController: messengerVC)
        let profileVC = ProfileViewController()
    
        viewControllers = [
            searchVC,
            savesVC,
            travelVC,
            navigationChats,
            profileVC
        ]
        
        // View
        
        tabBar.tintColor = .systemPink
        
        
        searchVC.tabBarItem.title = "Search"
        savesVC.tabBarItem.title = "Saves"
        travelVC.tabBarItem.title = "Travel"
        navigationChats.tabBarItem.title = "Inbox"
        profileVC.tabBarItem.title = "Profile"
        
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        savesVC.tabBarItem.image = UIImage(systemName: "heart")
        travelVC.tabBarItem.image = UIImage(systemName: "x.square")
        navigationChats.tabBarItem.image = UIImage(systemName: "bubble.right")
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        
    }
}
