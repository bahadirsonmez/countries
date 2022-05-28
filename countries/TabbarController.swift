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
    }
    
    func setupTabs() {
        let firstViewController = ViewController()
        let secondViewController = ViewController()
        
        let firstView: UIViewController = UINavigationController(rootViewController: firstViewController)
        let tabbarItem = UITabBarItem(title: "First", image: UIImage(systemName: "person.fill"), tag: 0)
        firstView.tabBarItem = tabbarItem
        
        let secondView: UIViewController = UINavigationController(rootViewController: secondViewController)
        let tabbarItem2 = UITabBarItem(title: "Second", image: UIImage(systemName: "person"), tag: 1)
        secondView.tabBarItem = tabbarItem2

        self.viewControllers = [firstView, secondView]
    }
    
}
 
