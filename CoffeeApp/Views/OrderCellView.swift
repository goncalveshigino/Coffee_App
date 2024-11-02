//
//  OrderCellView.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 27/10/24.
//

import SwiftUI

struct OrderCellView: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(order.name)
                    .bold()
                    .accessibilityIdentifier("orderNameText")
                   
                
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .accessibilityIdentifier("coffeeNameAndSizeText")
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .bold()
                .accessibilityIdentifier("coffeePriceText")
        }
    }
}


#Preview {
    OrderCellView(order: Order(id: 1, name: "Test", coffeeName: "Test 1", total: 20, size: .medium))
}
