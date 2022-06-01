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
    private var neighbours: [Country] = [] {
        didSet {
            self.reloadCompletion?()
        }
    }
    
    var reloadCompletion: (() -> Void)?
    var countryRetrieved: ((Country) -> Void)?
    
    init(with country: Country) {
        self.country = country
    }
    
    var title: String? {
        country.name?.common
    }
    
    var flagUrl: String {
        country.flags?.png ?? ""
    }
    
    var currencies: String? {
        let currencies = country.currencies?.values.compactMap(\.name).joined(separator: ", ")
        return currencies
    }
    
    var languages: String? {
        let languages = country.languages?.values.compactMap{ $0 }.joined(separator: ", ")
        return languages
    }
    
    var neighboursTitle: String? {
        "Neighbours (\(neighbours.count))"
    }
        
    func basicItem(at index: Int) -> BasicItemViewModel? {
        BasicItemViewModel(with: neighbours[index].name?.common ?? "")
    }
    
    var numberOfItems: Int {
        neighbours.count
    }
    
    func countryItem(at index: Int) -> CountryDetailViewModel? {
        CountryDetailViewModel(with: neighbours[index])
    }
    
    var mapItemViewModel: MapViewModel {
        MapViewModel(with: country)
    }
    
    func getNeighbours() {
        guard let neighbours = country.borders else { return }
        let request = CountriesByCodesRequest(with: neighbours)
        service.getCountriesByCode(request: request) { [weak self] result in
            switch result {
            case .success(let countries):
                self?.neighbours = countries
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCountry(at index: Int) {
        guard let code = neighbours[index].cca3 else { return }
        let request = CountryByCodeRequest(with: code)
        service.getCountryByCode(request: request) { [weak self] result in
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
