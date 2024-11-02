//
//  CoffeeModel.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 27/10/24.
//

import Foundation

@MainActor
class CoffeeModel: ObservableObject {
    
    let webservice: WebService
    
    @Published private(set) var orders: [Order] = []
    
    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    
    func populateOrders() async throws {
        orders =  try await webservice.getOrders()
    }
    
    func placeOrder(_ order: Order) async throws {
        let newOrder = try await webservice.placeOrder(order: order)
        orders.append(newOrder)
    }
    
    func deleteOrder(_ orderId: Int) async throws {
        let deleteOrder = try await webservice.deleteOrder(orderId: orderId)
        orders = orders.filter { $0.id != deleteOrder.id }
    }
}
