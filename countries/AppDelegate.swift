//
//  AppDelegate.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var tabbarController: UINavigationController {
        let viewController = TabbarController()
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.rootViewController = tabbarController
        self.window?.makeKeyAndVisible()
        return true
    }
}

