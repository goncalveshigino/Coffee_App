//
//  OrderDetailView.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 03/11/24.
//

import SwiftUI

struct OrderDetailView: View {
    
    let orderId: Int
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var model: CoffeeModel
    @State private var isPresented: Bool = false
    
    private func deleteOrder() async {
        do {
            try await model.deleteOrder(orderId)
            dismiss()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            
            if let order = model.orderById(orderId) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(order.coffeeName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("coffeeNameText")
                    
                    Text(order.size.rawValue).opacity(0.5)
                    
                    Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                    
                    HStack {
                        Spacer()
                        
                        Button("Delete Order", role: .destructive) {
                            Task {
                                await deleteOrder()
                            }
                        }
                        
                        Button("Edit Order") {
                            isPresented = true
                        }.accessibilityIdentifier("editOrderButton")
                        
                        Spacer()
                    }
                }.sheet(isPresented: $isPresented) {
                    AddCoffeeView(order: order)
                }
            }
            
            Spacer()
            
        }.padding()
    }
}

#Preview {
    var config = Configuration()
    OrderDetailView(orderId: 1)
        .environmentObject(CoffeeModel(webservice: WebService(baseURL: config.environment.baseURL)))
}
