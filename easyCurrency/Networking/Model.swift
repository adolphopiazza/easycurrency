//
//  Model.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import Foundation

struct Model: Decodable {
    
    var date: String?
    var currencies: CurrenciesModel?
    
    struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let keys = container.allKeys
        
        for key in keys {
            if key.stringValue == "date" {
                self.date = try container.decode(String.self, forKey: key)
                continue
            }
            
            // If it's some other currency as key
            self.currencies = try container.decode(CurrenciesModel.self, forKey: key)
        }
    }
    
}

struct CurrenciesModel: Decodable {
    let usd: Double?
    let brl: Double?
    let eur: Double?
}
