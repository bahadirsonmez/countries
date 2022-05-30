//
//  MapViewModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

import CoreLocation

class MapViewModel: NSObject {
    
    private let country: Country

    init(with country: Country) {
        self.country = country
    }
    
    var title: String? {
        country.name?.common
    }

    var location: CLLocation {
        if let latlng = country.latlng, latlng.count == 2 {
            let lat = latlng[0]
            let long = latlng[1]
            return CLLocation(latitude: lat, longitude: long)
        }
        return CLLocation(latitude: 0, longitude: 0)
    }
    
    var area: CLLocationDistance {
        country.area ?? 100000
    }

}
