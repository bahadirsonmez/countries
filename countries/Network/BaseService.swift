//
//  BaseService.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Alamofire
import Foundation

class BaseService {
    func performRequest<T:Decodable>(request: BaseURLRequest, completion:@escaping (Result<T, AFError>)->Void) {
        LoadingView().startLoading()
        AF.request(request)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T, AFError>) in
                LoadingView().stopLoading()
                completion(response.result)
            }
    }
}
