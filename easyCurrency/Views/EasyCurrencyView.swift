//
//  EasyCurrencyView.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import SwiftUI

struct EasyCurrencyView: View {
    
    @EnvironmentObject var viewModel: EasyCurrencyViewModel
    
    var body: some View {
        VStack {
            Menu("What currency do you want to view?") {
                ForEach(Currency.allCases, id: \.rawValue) { currency in
                    Button {
                        viewModel.viewCurrency = currency
                        viewModel.updateViewTitle()
                    } label: {
                        HStack(spacing: 8) {
                            if let selectedCurrency = viewModel.viewCurrency, selectedCurrency == currency {
                                Image(systemName: "checkmark")
                            }
                            
                            Text("\(currency.rawValue) - \(currency.description)")
                        }
                    }
                    .disabled(viewModel.viewCurrency == currency)
                }
            }
            
            Menu("What's the base currency?") {
                ForEach(Currency.allCases, id: \.rawValue) { currency in
                    Button {
                        viewModel.baseCurrency = currency
                        
                        Task {
                            await viewModel.getCurrencies()
                        }
                    } label: {
                        HStack(spacing: 8) {
                            if let selectedCurrency = viewModel.baseCurrency, selectedCurrency == currency {
                                Image(systemName: "checkmark")
                            }
                            
                            Text("\(currency.rawValue) - \(currency.description)")
                        }
                    }
                    .disabled(viewModel.baseCurrency == currency)
                }
            }
            .disabled(viewModel.viewCurrency == nil)
            
            if let currencies = viewModel.currencies, let baseCurrency = viewModel.baseCurrency {
                Divider()
                
                Menu("\(1.formatted(.currency(code: baseCurrency.rawValue))) equals to") {
                    ForEach(Currency.allCases, id: \.rawValue) { currency in
                        if let currencyValue = currencies.currencies[currency] {
                            Button("\(currencyValue.formatted(.currency(code: currency.rawValue))) - \(currency.description)") {
                                let pasteboard = NSPasteboard.general
                                pasteboard.declareTypes([.string], owner: nil)
                                pasteboard.setString("One \(baseCurrency.rawValue) values \(currencyValue.formatted(.currency(code: currency.rawValue))) today", forType: .string)
                            }
                        }
                    }
                }
            }
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
    }
    
}

#Preview {
    EasyCurrencyView()
        .environmentObject(EasyCurrencyViewModel())
}
