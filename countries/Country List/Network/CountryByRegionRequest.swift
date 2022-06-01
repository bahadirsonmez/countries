//
//  CountryRequest.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

final class CountryByRegionRequest: BaseURLRequest {
    
    init(with region: String) {
        super.init()
        self.path = "v3.1/region/\(region)"
    }
}

final class CountryByCodeRequest: BaseURLRequest {
    
    init(with codeString: String) {
        super.init()
        self.path = "v3.1/alpha/\(codeString)"
    }
}

final class CountriesByCodesRequest: BaseURLRequest {
    
    init(with codes: [String]) {
        super.init()
        let codesString = codes.joined(separator: ",")
        self.path = "v3.1/alpha?codes=\(codesString)"
    }
}
