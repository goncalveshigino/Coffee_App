//
//  View+Extensions.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 29/10/24.
//

import Foundation
import SwiftUI


extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        
        switch value {
        case true:
            self
        case false:
            EmptyView()
        }
    }
    
}
