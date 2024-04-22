//
//  InfoMenuView.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI

struct InfoMenuView: View {
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            
            ShareLink(item: Routes(endpoint: .appStore).url) {
                SmallButtonImageView(icon: SFSymbols.share)
            }
            .onTapGesture {
                FeedbackManager.haptics(style: .light)
            }
        }
    }
    
}

#Preview {
    InfoMenuView()
}
