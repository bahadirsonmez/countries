//
//  RegionListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class RegionListViewModel {
    let regions: [Region]
    
    init(with continents: [Region]) {
        self.regions = continents
    }
    
    var numberOfItems: Int {
        regions.count
    }
    
    func continentItemViewModel(at index: Int) -> ContinentItemViewModel {
        ContinentItemViewModel(with: regions[index])
    }
}

class ContinentItemViewModel {
    let region: Region
    
    init(with region: Region) {
        self.region = region
    }
    
    var title: String? {
        region.rawValue
    }
}

