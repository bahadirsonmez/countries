//
//  RegionListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class RegionListViewModel {
    let regions: [Region]
    
    init(with regions: [Region]) {
        self.regions = regions
    }
    
    var numberOfItems: Int {
        regions.count
    }
    
    func regionItemViewModel(at index: Int) -> BasicItemViewModel {
        BasicItemViewModel(with: regions[index].rawValue)
    }
}

class BasicItemViewModel {
    let region: String
    
    init(with region: String) {
        self.region = region
    }
    
    var title: String? {
        region
    }
}

