//
//  CountryListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import Foundation

class CountryListViewModel: NSObject {
    
    private var countries: [Country] = [] {
        didSet {
            reloadCompletion?()
        }
    }
    private let service = CountryService()
    private let region: Region
    
    var reloadCompletion: (() -> Void)?
    
    init(with region: Region) {
        self.region = region
    }
    
    var title: String? {
        region.rawValue
    }
        
    var numberOfItems: Int {
        countries.count
    }
    
    func countryItem(at index: Int) -> CountryItemViewModel? {
        CountryItemViewModel(with: countries[index])
    }
    
    func getCountries() {
        let request = CountryRequest(with: region)
        service.getCountries(request: request) { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
