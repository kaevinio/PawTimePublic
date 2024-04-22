//
//  OnboardingView.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Properties
    
    @AppStorage(AppStorageKey.onboarding.rawValue) private var onboarding = false
    
    @Binding var sheet: Sheet?
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.minorPadding) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: Values.largePadding) {
                    LogoHeader(header: Strings.welcomeTo)
                        .padding(.top, Values.regularPadding)
                    
                    VStack(spacing: Values.regularPadding) {
                        ForEach(Onboarding.allCases) { item in
                            InfoItemView(icon: item.icon,
                                         header: item.header,
                                         details: item.detail)
                        }
                    }
                }
                .padding(.horizontal, Values.regularPadding)
            }
            
            PrimaryButton(title: Strings.letsGo, disabled: false, action: dismissView)
                .padding(.horizontal, Values.regularPadding)
                .padding(.bottom, Values.minorPadding)
        }
        .interactiveDismissDisabled()
        .background(Colors.primaryBackground.opacity(0.2))
        .background(
            InfoCollageView()
                .padding(.top, Values.largePadding * 5)
        )
    }
    
    
    
    // MARK: - Functions
    
    private func dismissView() {
        onboarding = true
        sheet = nil
    }
    
}
