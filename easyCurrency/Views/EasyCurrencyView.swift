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
        Button("View title: \(viewModel.viewTitle)") {
            print("nothing for now")
        }
        .padding()
        .task {
            await viewModel.getCurrencies()
        }
    }
    
}

#Preview {
    EasyCurrencyView()
}
