//
//  Model.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import Foundation

struct Model: Decodable {
    
    var date: String?
    var currencies: [Currency: Double] = [:]
    
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

            let currencies = try container.decode([String: Double].self, forKey: key)
            for (currency, value) in currencies {
                if let setCurrency = Currency(rawValue: currency.uppercased()) {
                    self.currencies[setCurrency] = value
                }
            }
        }
    }
    
}
