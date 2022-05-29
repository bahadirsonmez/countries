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
//        if request.blocks {
//            HudHelper.showBlockingHud()
//        }
        AF.request(request)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T, AFError>) in
                completion(response.result)
//                if request.blocks {
//                    HudHelper.hideBlockingHud()
//                }
            }
    }
}
