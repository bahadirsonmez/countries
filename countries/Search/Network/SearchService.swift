//
//  SearchService.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Alamofire

class SearchService: BaseService {
    
    func searchCountryByName(request: SearchRequest, completion:@escaping (Result<[Country], AFError>)->Void) {
        self.performRequest(request: request, completion: completion)
    }
    
}
