//
//  SearchViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

class SearchViewModel: NSObject {
    
    private var countries = [Country]() {
        didSet {
            self.reloadCompletion?()
        }
    }
    
    private let service = SearchService()
    
    var searchText: String? = nil {
        didSet {
            searchCountryByName()
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
    
    func country(at index: Int) -> Country {
        countries[index]
    }
    
    func searchCountryByName() {
        guard let query = searchText else {
            countries.removeAll()
            return
        }
        let request = SearchRequest(with: query)
        service.searchCountryByName(request: request) { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
            case .failure(let error):
                self?.countries.removeAll()
                print(error.localizedDescription) // Should not present an alert
            }
        }
    }

}
