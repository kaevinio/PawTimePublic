//
//  CreateInfoView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI
import StoreKit

struct InfoView: View {
    
    // MARK: - Properties
    
    @AppStorage(AppStorageKey.onboarding.rawValue) private var onboarding = false
    @AppStorage(AppStorageKey.calculationCount.rawValue) private var calculationCount = 1
    
    @Environment(\.requestReview) private var requestReview
    
    @StateObject private var ageViewModel = AgeViewModel()
    
    @FocusState private var showKeyboard: Bool
    
    @State private var sheet: Sheet?
    
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            InfoPhotoView()
            
            VStack(spacing: Values.minorPadding / 2) {
                ScrollView(showsIndicators: false) {
                    InfoPhotoPicker()
                    
                    VStack(spacing: Values.largePadding) {
                        DefaultTextField(text: $ageViewModel.name, title: Strings.name, color: Colors.secondaryBackground)
                            .focused($showKeyboard)
                        
                        InfoBirthdayView()
                            .onTapGesture {
                                showDatePicker()
                            }
                        
                        InfoSizeView()
                    }
                    .padding(.horizontal, Values.regularPadding)
                    .padding(.bottom, Values.regularPadding)
                }
                
                PrimaryButton(title: Strings.calculate, disabled: !ageViewModel.enableCalc) {
                    ageViewModel.calculateAge()
                    checkForReview()
                }
                .padding(.horizontal, Values.regularPadding)
                .padding(.bottom, Values.minorPadding / 2)
            }
            .background(
                InfoCollageView()
                    .padding(.top, Values.photoSize)
            )
            
            InfoMenuView()
                .padding(.top, Values.largePadding * 1.5)
                .padding(.horizontal, Values.regularPadding)
        }
        .environmentObject(ageViewModel)
        .ignoresSafeArea(.keyboard)
        .ignoresSafeArea(edges: .top)
        .scrollDismissesKeyboard(.immediately)
        .background(Colors.primaryBackground.opacity(0.2))
        .blur(radius: ageViewModel.showResultView ? 36 : 0)
        .allowsHitTesting(!ageViewModel.showResultView)
        .sheet(item: $sheet) { sheet in
            switch sheet {
            case .onboarding:
                OnboardingView(sheet: $sheet)
            case .date:
                DatePickerView(sheet: $sheet, date: $ageViewModel.date)
                    .presentationDetents([.fraction(0.4)])
            }
        }
        .overlay {
            if ageViewModel.showResultView {
                ResultView()
                    .environmentObject(ageViewModel)
            }
        }
        .onAppear {
            checkForOnboarding()
        }
    }
    
    
    
    // MARK: - Functions
    
    private func showDatePicker() {
        FeedbackManager.haptics(style: .light)
        showKeyboard = false
        sheet = .date
    }
    
    private func checkForOnboarding() {
        guard !onboarding else { return }
        sheet = .onboarding
    }
    
    private func checkForReview() {
        if calculationCount.isMultiple(of: 3) {
            Task {
                try await Task.sleep(for: .seconds(4))
                requestReview()
            }
        }
        
        calculationCount += 1
    }
    
}

#Preview {
    InfoView()
}
