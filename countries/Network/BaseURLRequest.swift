//
//  BaseURLRequest.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Alamofire
import Foundation

class BaseURLRequest: URLRequestConvertible {
    
    private let baseURL: String = ""
    var path: String = ""
    var method: HTTPMethod = .get
    var parameters: Codable?
    
    var blocks: Bool = false
    
    func asURLRequest() throws -> URLRequest {
        let endpoint = baseURL + path
        guard let url = URL(string: endpoint)
        else {
            throw AFError.invalidURL(url: endpoint)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("IOS", forHTTPHeaderField: "X-Device-Platform")
//        urlRequest.setValue(Device.isPad() ? "TABLET" : "MOBILE", forHTTPHeaderField: "X-Device-Type")
//        urlRequest.setValue((Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String) ?? "", forHTTPHeaderField: "X-Device-Version")
//        urlRequest.setValue(Device.osVersion(), forHTTPHeaderField: "X-Device-Platform-Version")
//        urlRequest.setValue(Device.uniqueId, forHTTPHeaderField: "X-Device-Identifier")
//        urlRequest.setValue(UUID().uuidString, forHTTPHeaderField: "X-Request-Identifier")
//        urlRequest.setValue(UIDevice.current.nameOfModel, forHTTPHeaderField: "X-Device-Model")
//        urlRequest.setValue(latitude, forHTTPHeaderField: "X-Device-Latitude")
//        urlRequest.setValue(longitude, forHTTPHeaderField: "X-Device-Longitude")
//        urlRequest.setValue(locationParameters?.storeId, forHTTPHeaderField: "X-Store-Ids")

        if let parameters = parameters {
            do {
                urlRequest.httpBody = try parameters.jsonData()
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}
