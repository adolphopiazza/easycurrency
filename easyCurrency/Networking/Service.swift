//
//  Service.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import Foundation

final class Service {
    
    enum Errors: Error {
        case invalidURL
        case invalidFetch
    }
    
    static let shared: Service = Service()
    
    private let baseURL: String = "https://latest.currency-api.pages.dev/v1/currencies/"
    
    init() {}
    
    func getLatest(currency: Currency) async throws -> Model {
        guard let url = URL(string: baseURL + "\(currency.rawValue.lowercased()).json") else {
            throw Errors.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let currencies = try JSONDecoder().decode(Model.self, from: data)
            
            return currencies
        } catch {
            print("An error occured while fetching latest currencies: \(error)")
            throw Errors.invalidFetch
        }
    }
    
}
