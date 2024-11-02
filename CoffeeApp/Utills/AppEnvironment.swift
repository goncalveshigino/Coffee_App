//
//  AppEnvironment.swift
//  CoffeeApp
//
//  Created by Goncalves Higino on 28/10/24.
//

import Foundation

enum Endpoints {
    
    case allOrders
    case placeOrder
    case deleteOrder(Int)
    
    var path: String {
        switch self {
        case .allOrders:
            return "/test/orders"
        case .placeOrder:
            return "/test/new-order"
        case .deleteOrder(let orderId):
            return "/test/orders/\(orderId)"
        }
    }
}

struct Configuration {
    
    lazy var environment: AppEnvironment = {
        
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
        
    }()
}


enum AppEnvironment: String {
    case dev
    case test
    
    var baseURL: URL {
        switch self {
        case .dev:
            //return URL(string: "http://localhost:50315/orders")!
            return URL(string: "http://localhost:50916")!
        case .test:
            return URL(string: "http://localhost:50916")!
        }
    }
}
