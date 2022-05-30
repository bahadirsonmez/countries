//
//  CountryService.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Alamofire

class CountryService: BaseService {
    
    func getCountriesByRegion(request: CountryByRegionRequest, completion:@escaping (Result<[Country], AFError>)->Void) {
        self.performRequest(request: request, completion: completion)
    }
    
    func getCountriesByCode(request: CountryByCodesRequest, completion:@escaping (Result<[Country], AFError>)->Void) {
        self.performRequest(request: request, completion: completion)
    }

}
