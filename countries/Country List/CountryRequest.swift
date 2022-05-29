//
//  CountryRequest.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

final class CountryRequest: BaseURLRequest {
    
    init(with region: Region) {
        super.init()
        self.method = .get
        self.path = "v3.1/region/\(region.rawValue)"
    }
}
