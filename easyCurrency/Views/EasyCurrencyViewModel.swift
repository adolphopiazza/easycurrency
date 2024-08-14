//
//  EasyCurrencyViewModel.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import Foundation

final class EasyCurrencyViewModel: ObservableObject {
    
    @Published var viewTitle: String = "EasyCurrency"
    @Published var baseCurrency: Currency?
    @Published var viewCurrency: Currency?
    
    var currencies: Model?
    
    @MainActor func getCurrencies() async {
        guard let baseCurrency else { return }
        guard viewCurrency != nil else { return } // Just to avoid unnecessary API calls
        
        do {
            self.currencies = try await Service.shared.getLatest(currency: baseCurrency)
            updateViewTitle()
        } catch {
            print("An error occured while fetching currencies: \(error)")
        }
    }
    
    func updateViewTitle() {
        guard let viewCurrency else { return }
        guard let baseCurrency else { return }
        guard let currencies else { return }
        
        if let currency = currencies.currencies[viewCurrency] {
            viewTitle = "\(currency.formatted(.currency(code: viewCurrency.rawValue)))"
        }
    }
    
}
