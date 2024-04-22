//
//  DefaultShadow.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct DefaultShadow: ViewModifier {
    
    // MARK: - Properties
    
    let radius: CGFloat
    
    
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.15), radius: radius, x: 0, y: 0)
    }
    
}

extension View {
    func defaultShadow(with radius: CGFloat = Values.shadowRadius) -> some View {
        modifier(DefaultShadow(radius: radius))
    }
}
