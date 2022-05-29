//
//  CountryDetailViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

import Foundation

class CountryDetailViewModel: NSObject {
    
    private let country: Country
    private let service = CountryService()
    private let searchService = SearchService()
    private var neighbours: [String] {
        country.borders ?? []
    }
    
    var countryRetrieved: ((Country) -> Void)?
    
    init(with country: Country) {
        self.country = country
    }
    
    var currencies: String? {
        let currencies = country.currencies?.values.compactMap(\.name).joined(separator: ", ")
        return currencies
    }
    
    var languages: String? {
        let languages = country.languages?.values.compactMap{ $0 }.joined(separator: ", ")
        return languages
    }
    
    var flagUrl: String {
        country.flags?.png ?? ""
    }

    var numberOfItems: Int {
        neighbours.count
    }
    
    func countryItem(at index: Int) -> BasicItemViewModel? {
        BasicItemViewModel(with: neighbours[index])
    }
    
    func getCountry(at index: Int) {
        let code = neighbours[index]
        let request = CountryByCodeRequest(with: code)
        service.getCountriesByCode(request: request) { [weak self] result in
            switch result {
            case .success(let countries):
                guard let country = countries.first else { return }
                self?.countryRetrieved?(country)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
