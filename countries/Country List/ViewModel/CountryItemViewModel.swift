//
//  CountryItemViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class CountryItemViewModel {
    let country: Country
    
    init(with country: Country) {
        self.country = country
    }
    
    var title: String? {
        country.name?.common
    }
    
    var nativeTitles: String? {
        let titles = country.name?.nativeName?.compactMap { $0.value.common }
            .removingDuplicates()
            .joined(separator: ", ")
        return titles
    }
    
    var flagUrl: String {
        country.flags?.png ?? ""
    }
    
}
