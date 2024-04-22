//
//  DogSize.swift
//  PawTime
//
//  Created by Kaevin on 28.11.23.
//

import Foundation

enum DogSize: String, CaseIterable, Identifiable {
    case small, medium, large, giant
    
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .small: return Strings.small
        case .medium: return Strings.medium
        case .large: return Strings.large
        case .giant: return Strings.giant
        }
    }
    
    // Weight in kilograms
    var weights: (Float, Float) {
        switch self {
        case .small: return (1, 9)
        case .medium: return (9.5, 22.5)
        case .large: return (23, 45)
        case .giant: return (45.5, 100)
        }
    }
    
    var humanAges: [Float] {
        switch self {
        case .small: return [0, 15, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80]
        case .medium: return [0, 15, 24, 28, 32, 36, 42, 47, 51, 56, 60, 65, 69, 74, 78, 83, 87]
        case .large: return [0, 15, 24, 28, 32, 36, 45, 50, 55, 61, 66, 72, 77, 82, 88, 93, 99]
        case .giant: return [0, 12, 22, 31, 38, 45, 49, 56, 64, 71, 79, 86, 93, 100, 107, 114, 121]
        }
    }
}
