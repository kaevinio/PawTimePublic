//
//  CreateBirthdayView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct InfoBirthdayView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.minorPadding / 2) {
            Text(Strings.birthdate)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, Values.minorPadding)
            
            HStack(spacing: Values.minorPadding) {
                if Locale.metricsSystem {
                    DefaultLabel(placeholder: Strings.day, text: ageViewModel.day, color: Colors.secondaryBackground)
                    DefaultLabel(placeholder: Strings.month, text: ageViewModel.month, color: Colors.secondaryBackground)
                    DefaultLabel(placeholder: Strings.year, text: ageViewModel.year, color: Colors.secondaryBackground)
                } else {
                    DefaultLabel(placeholder: Strings.month, text: ageViewModel.month, color: Colors.secondaryBackground)
                    DefaultLabel(placeholder: Strings.day, text: ageViewModel.day, color: Colors.secondaryBackground)
                    DefaultLabel(placeholder: Strings.year, text: ageViewModel.year, color: Colors.secondaryBackground)
                }
            }
        }
    }
    
}

#Preview {
    InfoBirthdayView()
        .environmentObject(AgeViewModel())
}
