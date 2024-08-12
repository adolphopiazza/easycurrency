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
            Text("$ 5.51") // TODO: Update this with the preferred currency 
        }
        .menuBarExtraStyle(.window)

    }
    
}
