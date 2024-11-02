//
//  NumberFormatter+Extension.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 27/10/24.
//

import Foundation


extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
