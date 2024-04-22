//
//  PrimaryButton.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct PrimaryButton: View {
    
    // MARK: - Properties
    
    let title: String
    let disabled: Bool
    let action: () -> Void
    
    
    
    // MARK: - Body
    
    var body: some View {
        Button {
            FeedbackManager.haptics(style: .light)
            action()
        } label: {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, Values.regularPadding / 2)
                .background(disabled ? Colors.primaryHighlight.opacity(0.5) : Colors.primaryHighlight)
                .clipShape(Capsule())
        }
        .disabled(disabled)
    }
    
}

#Preview {
    PrimaryButton(title: "Preview", disabled: false) { }
}
