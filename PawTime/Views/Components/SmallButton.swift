//
//  SmallButton.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct SmallButton: View {
    
    // MARK: - Properties
    
    var icon: String?
    var title: String?
    var color: Color?
    let action: () -> Void
    
    
    
    // MARK: - Body
    
    var body: some View {
        Button {
            FeedbackManager.haptics(style: .light)
            action()
        } label: {
            if let icon {
                SmallButtonImageView(icon: icon, color: color)
            } else if let title {
                SmallButtonTextView(title: title, color: color)
            } else if let icon, let title {
                SmallButtonImageTextView(icon: icon, title: title, color: color)
            }
        }
        .buttonStyle(.plain)
    }
    
}

#Preview {
    SmallButton(icon: "checkmark") { }
}
