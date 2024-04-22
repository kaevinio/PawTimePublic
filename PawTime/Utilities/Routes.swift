//
//  Routes.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import Foundation

struct Routes {
    enum Endpoint {
        case appStore
    }
    
    var endpoint: Endpoint
    
    var url: URL {
        var unsafeURL: URL?
        
        switch endpoint {
        case .appStore:
            unsafeURL = URL(string: "https://apps.apple.com/us/app/id6473553918")
        }
        
        guard let safeURL = unsafeURL else {
            fatalError("Invalid URL for endpoint \(endpoint)")
        }
        
        return safeURL
    }
}
