//
//  easyCurrencyApp.swift
//  easyCurrency
//
//  Created by Adolpho Francisco Zimmermann Piazza on 11/08/24.
//

import SwiftUI

@main
struct easyCurrencyApp: App {
    
    var body: some Scene {
        MenuBarExtra {
            EasyCurrencyView()
        } label: {
            Image(systemName: "coloncurrencysign.arrow.circlepath")
        }
        .menuBarExtraStyle(.window)

    }
    
}
