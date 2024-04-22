//
//  SmallButtonImageTextView.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI

struct SmallButtonImageTextView: View {
    
    // MARK: - Properties
    
    let icon: String
    let title: String
    var color: Color?
    
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Values.regularPadding / 2) {
            Text(title)
                .font(.headline)
            
            Image(systemName: icon)
                .font(.caption)
        }
        .fontWeight(.bold)
        .padding(.vertical, Values.regularPadding / 2)
        .padding(.horizontal, Values.regularPadding)
        .frame(minHeight: Values.buttonSize)
        .defaultBackground(with: color)
        .foregroundStyle(color?.brightness == .light ? .black : .primary)
        .clipShape(Capsule())
    }
    
}

#Preview {
    SmallButtonImageTextView(icon: "square.and.arrow.up", title: "Teilen")
}
