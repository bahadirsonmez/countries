//
//  TabBarController.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        let regions: [Region] = [.africa, .americas, .oceania, .europe, .asia, .antarctic]
        let regionListViewModel = RegionListViewModel(with: regions)
        let firstViewController = RegionListViewController(viewModel: regionListViewModel)
                
        let firstView: UIViewController = UINavigationController(rootViewController: firstViewController)
        let tabbarItem = UITabBarItem(title: "Regions", image: UIImage(systemName: "list.bullet"), tag: 0)
        firstView.tabBarItem = tabbarItem
        
        let searchViewModel = SearchViewModel()
        let secondViewController = SearchViewController(viewModel: searchViewModel)
        
        let secondView: UIViewController = UINavigationController(rootViewController: secondViewController)
        let tabbarItem2 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        secondView.tabBarItem = tabbarItem2

        self.viewControllers = [firstView, secondView]
    }
    
}
 
