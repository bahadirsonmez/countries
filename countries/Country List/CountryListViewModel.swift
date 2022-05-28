//
//  CountryListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import Foundation

struct Country: Codable {
    let title: String?
}

class CountryItemViewModel {
    let country: Country
    
    init(with country: Country) {
        self.country = country
    }
    
    var title: String? {
        country.title
    }
}

class CountryListViewModel: NSObject {
    
    var data: [Country] {
        var array = [Country]()
        for i in 0...numberOfItems {
            let country = Country(title: "Test \(i)")
            array.append(country)
        }
        return array
    }
    
    var numberOfItems: Int {
        return 50
    }
    
    func countryItem(at index: Int) -> CountryItemViewModel? {
        CountryItemViewModel(with: data[index])
    }

}
