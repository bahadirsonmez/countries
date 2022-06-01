//
//  LoadingView.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

// Source: https://stackoverflow.com/a/58726383

import UIKit

class LoadingView: NSObject {
    
    static let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let activityIndicatorTag = 12345
    
    func startLoading() {
        stopLoading()
        let topController = ScreenHelper.getTopController()
        guard let topView = topController?.view else { return }
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.tag = LoadingView.activityIndicatorTag
        activityIndicator.center = topView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large

        DispatchQueue.main.async {
            topView.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }

    func stopLoading() {
        let topController = ScreenHelper.getTopController()
        guard let topView = topController?.view else { return }
        let activityIndicator = topView.viewWithTag(LoadingView.activityIndicatorTag) as? UIActivityIndicatorView
        DispatchQueue.main.async {
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
        }
    }

}

