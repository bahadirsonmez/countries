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
    let currencies: [String: Aed]?
    let region: Region?
    let subregion: String?
    let languages: [String: String]?
    let latlng: [Double]?
    let borders: [String]?
    let flag: String?
    let continents: [Continent]?
    let flags: Flags?
}

// MARK: - Flags
struct Flags: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
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
