//
//  DefaultBackground.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI

struct DefaultBackground: ViewModifier {
    
    // MARK: - Properties
    
    var color: Color?
    
    
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        if let color {
            content
                .background(color)
        } else {
            content
                .background(.regularMaterial)
        }
    }
    
}

extension View {
    func defaultBackground(with color: Color? = nil) -> some View {
        modifier(DefaultBackground(color: color))
    }
}
