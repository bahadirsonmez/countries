//
//  RegionListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class RegionListViewModel {
    
    // MARK: - Initialization
    
    let regions: [Region]
    
    init(with regions: [Region]) {
        self.regions = regions
    }
    
    // MARK: - Utilities
    
    var numberOfItems: Int {
        regions.count
    }
    
    func regionItemViewModel(at index: Int) -> BasicItemViewModel {
        BasicItemViewModel(with: regions[index].rawValue)
    }
    
}

class BasicItemViewModel {
    
    // MARK: - Initialization
    
    let region: String
    
    init(with region: String) {
        self.region = region
    }
    
    // MARK: - Variables
    
    var title: String? {
        region
    }
    
}

