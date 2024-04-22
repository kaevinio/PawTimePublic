//
//  ResultAnimationView.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI
import LottieUI

struct ResultAnimationView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    private let state1 = LUStateData(type: .name("dog", .main), speed: 3, loopMode: .playOnce, contentMode: .fit)
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            LottieView(state: state1)
                .frame(height: 300)
            
            Text(Strings.ageIsCalculating)
                .font(.title2)
                .fontWeight(.bold)
                .opacity(ageViewModel.showIsCalculating ? 1 : 0)
        }
    }
    
}

#Preview {
    ResultAnimationView()
}
