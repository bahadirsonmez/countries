//
//  BaseURLRequest.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Alamofire
import Foundation

class BaseURLRequest: URLRequestConvertible {
    
    private let baseURL: String = "https://restcountries.com/"
    var path: String = ""
    var method: HTTPMethod = .get
        
    func asURLRequest() throws -> URLRequest {
        let endpoint = baseURL + path
        guard let url = URL(string: endpoint)
        else {
            throw AFError.invalidURL(url: endpoint)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
