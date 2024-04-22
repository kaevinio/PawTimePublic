//
//  DefaultLabel.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct DefaultLabel: View {
    
    // MARK: - Properties
    
    let placeholder: String
    let text: String
    let color: Color
    
    
    
    // MARK: - Body
    
    var body: some View {
        Text(text.isEmpty ? placeholder : text)
            .font(.title3)
            .fontWeight(text.isEmpty ? .bold : .heavy)
            .foregroundStyle(text.isEmpty ? Colors.placeholder : .primary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.vertical, Values.regularPadding / 2)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadius))
            .defaultShadow()
    }
    
}

#Preview {
    DefaultLabel(placeholder: "Platz", text: "", color: Colors.secondaryBackground)
        .padding()
}
