//
//  CountryModel.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import Foundation

// MARK: - Country

struct Country: Codable {
    let name: Name?
    let cca3: String?
    let currencies: [String: Aed]?
    let region: Region?
    let languages: [String: String]?
    let latlng: [Double]?
    let borders: [String]?
    let area: Double?
    let flags: Flags?
}

// MARK: - Flags

struct Flags: Codable {
    let png: String?
    let svg: String?
}

// MARK: - Aed

struct Aed: Codable {
    let name, symbol: String?
}

// MARK: - Name

struct Name: Codable {
    let common, official: String?
    let nativeName: [String: Translation]?
}

// MARK: - Translation

struct Translation: Codable {
    let official, common: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}
