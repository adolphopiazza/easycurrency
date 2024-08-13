//
//  EasyCurrencyViewModel.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import Foundation

final class EasyCurrencyViewModel: ObservableObject {
    
    @Published var viewTitle: String = "easyCurrency"
    @Published var baseCurrency: Currency = .usd
    @Published var viewCurrency: Currency = .brl
    
    @MainActor func getCurrencies() async {
        do {
            let currencies = try await Service.shared.getLatest(currency: baseCurrency)
            
            if let currency = currencies.currencies[viewCurrency] {
                viewTitle = "\(currency.formatted(.currency(code: viewCurrency.rawValue)))"
            }
        } catch {
            print("An error occured while fetching currencies: \(error)")
        }
    }
    
}
