//
//  Currency.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 13/08/24.
//

import Foundation

enum Currency: String, CaseIterable {
    case ars = "ARS"
    case aud = "AUD"
    case eur = "EUR"
    case usd = "USD"
    case brl = "BRL"
    case bob = "BOB"
    case bgn = "BGN"
    case cad = "CAD"
    case clp = "CLP"
    case cny = "CNY"
    case cop = "COP"
    case crc = "CRC"
    case cup = "CUP"
    case czk = "CZK"
    case dkk = "DKK"
    case egp = "EGP"
    case hkd = "HKD"
    case isk = "ISK"
    case inr = "INR"
    case ils = "ILS"
    case jmd = "JMD"
    case jpy = "JPY"
    case gbp = "GBP"
    case mxn = "MXN"
    case nzd = "NZD"
    case nok = "NOK"
    case pyg = "PYG"
    case chf = "CHF"
    case uyu = "UYU"
    
    var description: String {
        switch self {
        case .ars:
            "Argentine Peso"
        case .aud:
            "Australian Dollar"
        case .eur:
            "Euro"
        case .usd:
            "US Dollar"
        case .brl:
            "Brazilian Real"
        case .bob:
            "Boliviano"
        case .bgn:
            "Bulgarian Lev"
        case .cad:
            "Canadian Dollar"
        case .clp:
            "Chilean Peso"
        case .cny:
            "Yuan Renminbi"
        case .cop:
            "Colombian Peso"
        case .crc:
            "Costa Rican Colon"
        case .cup:
            "Cuban Peso"
        case .czk:
            "Czech Koruna"
        case .dkk:
            "Danish Krone"
        case .egp:
            "Egyptian Pound"
        case .hkd:
            "Hong Kong Dollar"
        case .isk:
            "Iceland Krona"
        case .inr:
            "Indian Rupee"
        case .ils:
            "New Israeli Sheqel"
        case .jmd:
            "Jamaican Dollar"
        case .jpy:
            "Yen"
        case .gbp:
            "Pound Sterling"
        case .mxn:
            "Mexican Peso"
        case .nzd:
            "New Zealand Dollar"
        case .nok:
            "Norwegian Krone"
        case .pyg:
            "Guarani"
        case .chf:
            "Swiss Franc"
        case .uyu:
            "Peso Uruguayo"
        }
    }
}
