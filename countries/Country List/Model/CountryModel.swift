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
    let currencies: Currencies?
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

// MARK: - Currencies
struct Currencies: Codable {
    let dop, ghs, eur, khr: Aed?
    let usd, bhd, ils, qar: Aed?
    let ron, mga, npr, gbp: Aed?
    let jep, uah, dkk, mru: Aed?
    let lyd, tmt, aoa, shp: Aed?
    let amd, thb, azn, gnf: Aed?
    let kyd, xcd, sll, cny: Aed?
    let gel, jpy, fkp, ern: Aed?
    let aud, kid, ars, php: Aed?
    let bnd, sgd, xof, xaf: Aed?
    let kgs, nad, zar, kes: Aed?
    let gip, kzt, krw, pkr: Aed?
    let sos, zmw, mwk, ssp: Aed?
    let mad, tvd, ngn, etb: Aed?
    let cad, cve, dzd, pen: Aed?
    let pln, vuv, bgn, imp: Aed?
    let tzs, nok, ggp, uzs: Aed?
    let currenciesTRY, fjd, byn, gtq: Aed?
    let uyu, ckd, nzd, twd: Aed?
    let lsl, ves, lkr, lrd: Aed?
    let cuc, cup, kmf, kwd: Aed?
    let bmd, egp, jod, pgk: Aed?
    let szl, vnd, mnt, yer: Aed?
    let mop, bsd, sar, lak: Aed?
    let mmk, hrk, bzd, mkd: Aed?
    let rsd, sbd, lbp, irr: Aed?
    let bam, sdg, afn, fok: Aed?
    let hnl, tjs, crc, mdl: Aed?
    let chf, czk, brl, bwp: Aed?
    let bif, gyd, syp, xpf: Aed?
    let huf, wst, tnd, jmd: Aed?
    let kpw, cop, omr, mzn: Aed?
    let bob, ugx, htg, stn: Aed?
    let inr, pyg, ang: Aed?
    let isk, djf, aed, iqd: Aed?
    let zwl, mxn, mur, rub: Aed?
    let top, srd, pab, rwf: Aed?
    let ttd, myr, sek, all: Aed?
    let scr, idr, bdt, bbd: Aed?
    let mvr, cdf, awg, gmd: Aed?
    let hkd, btn, nio, clp: Aed?

    enum CodingKeys: String, CodingKey {
        case dop = "DOP"
        case ghs = "GHS"
        case eur = "EUR"
        case khr = "KHR"
        case usd = "USD"
        case bhd = "BHD"
        case ils = "ILS"
        case qar = "QAR"
        case ron = "RON"
        case mga = "MGA"
        case npr = "NPR"
        case gbp = "GBP"
        case jep = "JEP"
        case uah = "UAH"
        case dkk = "DKK"
        case mru = "MRU"
        case lyd = "LYD"
        case tmt = "TMT"
        case aoa = "AOA"
        case shp = "SHP"
        case amd = "AMD"
        case thb = "THB"
        case azn = "AZN"
        case gnf = "GNF"
        case kyd = "KYD"
        case xcd = "XCD"
        case sll = "SLL"
        case cny = "CNY"
        case gel = "GEL"
        case jpy = "JPY"
        case fkp = "FKP"
        case ern = "ERN"
        case aud = "AUD"
        case kid = "KID"
        case ars = "ARS"
        case php = "PHP"
        case bnd = "BND"
        case sgd = "SGD"
        case xof = "XOF"
        case xaf = "XAF"
        case kgs = "KGS"
        case nad = "NAD"
        case zar = "ZAR"
        case kes = "KES"
        case gip = "GIP"
        case kzt = "KZT"
        case krw = "KRW"
        case pkr = "PKR"
        case sos = "SOS"
        case zmw = "ZMW"
        case mwk = "MWK"
        case ssp = "SSP"
        case mad = "MAD"
        case tvd = "TVD"
        case ngn = "NGN"
        case etb = "ETB"
        case cad = "CAD"
        case cve = "CVE"
        case dzd = "DZD"
        case pen = "PEN"
        case pln = "PLN"
        case vuv = "VUV"
        case bgn = "BGN"
        case imp = "IMP"
        case tzs = "TZS"
        case nok = "NOK"
        case ggp = "GGP"
        case uzs = "UZS"
        case currenciesTRY = "TRY"
        case fjd = "FJD"
        case byn = "BYN"
        case gtq = "GTQ"
        case uyu = "UYU"
        case ckd = "CKD"
        case nzd = "NZD"
        case twd = "TWD"
        case lsl = "LSL"
        case ves = "VES"
        case lkr = "LKR"
        case lrd = "LRD"
        case cuc = "CUC"
        case cup = "CUP"
        case kmf = "KMF"
        case kwd = "KWD"
        case bmd = "BMD"
        case egp = "EGP"
        case jod = "JOD"
        case pgk = "PGK"
        case szl = "SZL"
        case vnd = "VND"
        case mnt = "MNT"
        case yer = "YER"
        case mop = "MOP"
        case bsd = "BSD"
        case sar = "SAR"
        case lak = "LAK"
        case mmk = "MMK"
        case hrk = "HRK"
        case bzd = "BZD"
        case mkd = "MKD"
        case rsd = "RSD"
        case sbd = "SBD"
        case lbp = "LBP"
        case irr = "IRR"
        case bam = "BAM"
        case hnl = "HNL"
        case tjs = "TJS"
        case crc = "CRC"
        case mdl = "MDL"
        case chf = "CHF"
        case czk = "CZK"
        case brl = "BRL"
        case bwp = "BWP"
        case bif = "BIF"
        case gyd = "GYD"
        case syp = "SYP"
        case xpf = "XPF"
        case huf = "HUF"
        case wst = "WST"
        case tnd = "TND"
        case jmd = "JMD"
        case kpw = "KPW"
        case cop = "COP"
        case omr = "OMR"
        case mzn = "MZN"
        case bob = "BOB"
        case ugx = "UGX"
        case htg = "HTG"
        case stn = "STN"
        case inr = "INR"
        case pyg = "PYG"
        case ang = "ANG"
        case sdg = "SDG"
        case isk = "ISK"
        case djf = "DJF"
        case aed = "AED"
        case iqd = "IQD"
        case zwl = "ZWL"
        case mxn = "MXN"
        case mur = "MUR"
        case rub = "RUB"
        case top = "TOP"
        case srd = "SRD"
        case pab = "PAB"
        case rwf = "RWF"
        case ttd = "TTD"
        case myr = "MYR"
        case sek = "SEK"
        case all = "ALL"
        case scr = "SCR"
        case idr = "IDR"
        case bdt = "BDT"
        case bbd = "BBD"
        case mvr = "MVR"
        case cdf = "CDF"
        case awg = "AWG"
        case gmd = "GMD"
        case hkd = "HKD"
        case btn = "BTN"
        case nio = "NIO"
        case clp = "CLP"
        case afn = "AFN"
        case fok = "FOK"
    }
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
