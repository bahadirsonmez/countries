//
//  Encodable+extension.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import Foundation

extension Encodable {
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
