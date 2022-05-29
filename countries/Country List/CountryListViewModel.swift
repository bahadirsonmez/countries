//
//  CountryListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
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
}

class CountryListViewModel: NSObject {
    
    private var countries = [Country]()
    private let continentName: String
    
    init(with name: String) {
        self.continentName = name
    }
    
    var title: String? {
        continentName
    }
        
    var numberOfItems: Int {
        countries.count
    }
    
    func countryItem(at index: Int) -> CountryItemViewModel? {
        CountryItemViewModel(with: countries[index])
    }

}
