//
//  String+Extensions.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 29/10/24.
//

import Foundation


extension String {
    
    var isNumeric: Bool {
        Double(self) != nil
    }
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    func isLessThan(_ number: Double) -> Bool {
        if !self.isNumeric {
            return false
        }
        
        guard let value = Double(self) else { return false }
        return value < number
    }
}
