//
//  CountryListViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import Foundation

class CountryListViewModel: NSObject {
    
    // MARK: - Initialization
    
    private let service = CountryService()
    private let region: String
        
    init(with region: String) {
        self.region = region
    }
    
    // MARK: - Closures
    
    var reloadCompletion: (() -> Void)?
    
    // MARK: - Variables
    
    private var countries: [Country] = [] {
        didSet {
            reloadCompletion?()
        }
    }
    
    var title: String? {
        region
    }
    
    // MARK: - Utilities
    
    var numberOfItems: Int {
        countries.count
    }
        
    func countryItem(at index: Int) -> CountryItemViewModel {
        CountryItemViewModel(with: countries[index])
    }
    
    func country(at index: Int) -> Country {
        countries[index]
    }
    
    // MARK: - Requests
    
    func getCountries() {
        let request = CountryByRegionRequest(with: region)
        service.getCountriesByRegion(request: request) { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
            case .failure(let error):
                AlertHelper.showAlertMessage(messageStr: error.localizedDescription)
            }
        }
    }

}
