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
                    } label: {
                        HStack(spacing: 8) {
                            if let selectedCurrency = viewModel.viewCurrency, selectedCurrency == currency {
                                Image(systemName: "checkmark")
                            }
                            
                            Text(currency.rawValue)
                        }
                    }
                    .disabled(viewModel.viewCurrency == currency)
                }
            }
            
            Menu("What's the base currency?") {
                ForEach(Currency.allCases, id: \.rawValue) { currency in
                    Button {
                        viewModel.baseCurrency = currency
                    } label: {
                        HStack(spacing: 8) {
                            if let selectedCurrency = viewModel.baseCurrency, selectedCurrency == currency {
                                Image(systemName: "checkmark")
                            }
                            
                            Text(currency.rawValue)
                        }
                    }
                    .disabled(viewModel.baseCurrency == currency)
                }
            }
            .disabled(viewModel.viewCurrency == nil)
        }
        .padding()
        .onChange(of: viewModel.baseCurrency) {
            Task {
                await viewModel.getCurrencies()
            }
        }
        .onChange(of: viewModel.viewCurrency) {
            viewModel.updateViewTitle()
        }
    }
    
}

#Preview {
    EasyCurrencyView()
        .environmentObject(EasyCurrencyViewModel())
}
