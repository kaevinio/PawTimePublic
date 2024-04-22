//
//  InfoItemView.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

struct InfoItemView: View {
    
    // MARK: - Properties
    
    let icon: String
    let header: String
    let details: String
    
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Values.minorPadding) {
            VStack(spacing: Values.minorPadding / 4) {
                Text(header)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(details)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.primary)
            
            Image(systemName: icon)
                .foregroundColor(Colors.primaryHighlight)
                .font(.largeTitle)
        }
        .padding(Values.minorPadding)
        .defaultBackground(with: Colors.secondaryBackground)
        .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadius))
        .defaultShadow()
    }
    
}
