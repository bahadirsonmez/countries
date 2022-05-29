//
//  SearchViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class SearchViewModel: NSObject {
    
    private var countries = [Country]()
    private let service = CountryService()
    
    var searchText: String? = nil {
        didSet {
            getCountries()
        }
    }
    
    var reloadCompletion: (() -> Void)?
        
    var title: String? {
        "Search"
    }
        
    var numberOfItems: Int {
        countries.count
    }
    
    func countryItem(at index: Int) -> CountryItemViewModel? {
        CountryItemViewModel(with: countries[index])
    }
    
    func getCountries() {
        let request = CountryRequest(with: .europe)
        service.getCountries(request: request) { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
                self?.reloadCompletion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
