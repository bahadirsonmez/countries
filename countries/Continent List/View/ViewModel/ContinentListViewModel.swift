//
//  ContinentListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class ContinentListViewModel {
    let continents: [Continent]
    
    init(with continents: [Continent]) {
        self.continents = continents
    }
    
    var numberOfItems: Int {
        continents.count
    }
    
    func continentItemViewModel(at index: Int) -> ContinentItemViewModel {
        ContinentItemViewModel(with: continents[index])
    }
}

class ContinentItemViewModel {
    let continent: Continent
    
    init(with continent: Continent) {
        self.continent = continent
    }
    
    var title: String? {
        continent.rawValue
    }
}

