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
    
    var data = [Country]()
        
    var numberOfItems: Int {
        return data.count
    }
    
    func countryItem(at index: Int) -> CountryItemViewModel? {
        CountryItemViewModel(with: data[index])
    }

}
