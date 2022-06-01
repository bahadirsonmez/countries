//
//  SearchRequest.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

final class SearchRequest: BaseURLRequest {
    
    init(with searchText: String) {
        super.init()
        self.path = "v3.1/name/\(searchText)"
    }
    
}
