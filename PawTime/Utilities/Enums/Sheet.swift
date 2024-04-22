//
//  Sheet.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import Foundation

enum Sheet: String, Identifiable, Equatable {
    case onboarding, date
    
    
    var id: String { rawValue }
}
