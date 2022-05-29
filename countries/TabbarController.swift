//
//  TabbarController.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        self.tabBar.isOpaque = true
        self.tabBar.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    func setupTabs() {
        let continents: [Continent] = [.africa, .antarctica, .asia, .europe, .northAmerica, .oceania, .southAmerica]
        let continentsViewModel = ContinentListViewModel(with: continents)
        let firstViewController = ContinentListViewController(viewModel: continentsViewModel)
        let secondViewController = ViewController()
        
        let firstView: UIViewController = UINavigationController(rootViewController: firstViewController)
        let tabbarItem = UITabBarItem(title: "Countries", image: UIImage(systemName: "list.bullet"), tag: 0)
        firstView.tabBarItem = tabbarItem
        
        let secondView: UIViewController = UINavigationController(rootViewController: secondViewController)
        let tabbarItem2 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        secondView.tabBarItem = tabbarItem2

        self.viewControllers = [firstView, secondView]
    }
    
}
 
