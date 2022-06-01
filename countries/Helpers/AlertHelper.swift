//
//  AlertHelper.swift
//  countries
//
//  Created by Bahadır Kişisel on 1.06.2022.
//

import UIKit

class AlertHelper: NSObject {
    
    static func showAlertMessage(titleStr: String = "Error", messageStr: String) {
        guard let topController = ScreenHelper.getTopController() else { return }
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: .alert);
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.view.tintColor = .label
        topController.present(alert, animated: true, completion: nil)
    }
    
}
