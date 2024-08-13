//
//  easyCurrencyApp.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import SwiftUI

@main
struct easyCurrencyApp: App {
    
    @StateObject var viewModel: EasyCurrencyViewModel = .init()
    
    var body: some Scene {
        MenuBarExtra {
            EasyCurrencyView()
                .environmentObject(viewModel)
        } label: {
            Text(viewModel.viewTitle)
        }
        .menuBarExtraStyle(.window)
    }
    
}
