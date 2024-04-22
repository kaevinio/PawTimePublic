//
//  SmallButtonImageView.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI

struct SmallButtonImageView: View {
    
    // MARK: - Properties
    
    let icon: String
    var color: Color?
    
    
    
    // MARK: - Body
    
    var body: some View {
        Image(systemName: icon)
            .font(.headline)
            .fontWeight(.bold)
            .frame(width: Values.buttonSize, height: Values.buttonSize)
            .defaultBackground(with: color)
            .foregroundStyle(color?.brightness == .light ? .black : .primary)
            .clipShape(Circle())
    }
    
}

#Preview {
    SmallButtonImageView(icon: "plus")
}
