//
//  SmallButtonTextView.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI

struct SmallButtonTextView: View {
    
    // MARK: - Properties
    
    let title: String
    var color: Color?
    
    
    
    // MARK: - Body
    
    var body: some View {
        Text(title)
            .font(.headline)
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
    SmallButtonTextView(title: "Drück mich!")
}
