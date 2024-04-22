//
//  InfoCollageView.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

struct InfoCollageView: View {
    
    // MARK: - Properties
    
    @State private var images = Illustration.allCases.shuffled()[0...5]
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.minorPadding) {
            images[0].image
                .frame(width: 72, height: 72)
                .padding(.top, -Values.largePadding)
                .padding(.trailing, Values.largePadding * 5)
                .rotationEffect(.degrees(-8))
            
            images[1].image
                .frame(width: 72, height: 72)
                .padding(.top, -Values.regularPadding)
                .padding(.leading, Values.largePadding * 6)
                .rotationEffect(.degrees(12))
            
            images[2].image
                .frame(width: 72, height: 72)
                .padding(.top, -Values.largePadding)
                .padding(.trailing, Values.largePadding * 6)
                .rotationEffect(.degrees(-12))
            
            images[3].image
                .frame(width: 72, height: 72)
                .padding(.leading, Values.largePadding * 3.5)
                .rotationEffect(.degrees(6))
            
            images[4].image
                .frame(width: 72, height: 72)
                .padding(.trailing, Values.largePadding * 8)
                .rotationEffect(.degrees(-12))
            
            images[5].image
                .frame(width: 72, height: 72)
                .padding(.leading, Values.largePadding * 6.5)
                .rotationEffect(.degrees(3))
        }
        .opacity(0.1)
    }
    
}

#Preview {
    InfoCollageView()
}
