//
//  ScreenHelper.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

import UIKit

class ScreenHelper: NSObject {

    class func getTopController(_ root: UIViewController? = nil) -> UIViewController? {
        let rootController = root ?? self.getRootController()
        var controller = rootController
        if let presentedController = controller?.presentedViewController {
            controller = presentedController
            return getTopController(controller)
        } else if let pageController = controller as? UIPageViewController {
            if let selectedController =  pageController.viewControllers?.first {
                controller = selectedController
            }
            return getTopController(controller)
        } else if let navController = controller as? UINavigationController {
            controller = navController.topViewController
            return getTopController(controller)

        } else if let tabController = controller as? UITabBarController {
            controller = tabController.selectedViewController
            controller!.view.layoutIfNeeded()
            return getTopController(controller)
            
        }
        return controller
    }

    class func getRootController() -> UIViewController? {
        let delegate  =  UIApplication.shared.delegate
        let window = delegate?.window
        let rootController = window??.rootViewController
        return rootController
    }
}
