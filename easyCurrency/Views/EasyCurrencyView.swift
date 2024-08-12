//
//  EasyCurrencyView.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import SwiftUI

struct EasyCurrencyView: View {
    
    var body: some View {
        Button("Test get latest USD currency") {
            Task {
                do {
                    try await Service.shared.getLatest(currency: "usd")
                } catch {
                    print("error: \(error)")
                }
            }
        }
        .padding()
    }
    
}

#Preview {
    EasyCurrencyView()
}
