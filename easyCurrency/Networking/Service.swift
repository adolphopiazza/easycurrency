//
//  Service.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import Foundation

final class Service {
    
    static let shared: Service = Service()
    
    init() {}
    
    func getLatest(currency: String) async throws {
        guard let url = URL(string: "https://latest.currency-api.pages.dev/v1/currencies/\(currency).json") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let currencies = try JSONDecoder().decode(Model.self, from: data)
            
            print(currencies)
        } catch {
            print("some error: \(error)")
            throw error
        }
    }
    
}
