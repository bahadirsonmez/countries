//
//  CountryService.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Alamofire

class CountryService: BaseService {
    
    func getCountries(request: CountryRequest, completion:@escaping (Result<[Country], AFError>)->Void) {
        self.performRequest(request: request, completion: completion)
    }
    
}
