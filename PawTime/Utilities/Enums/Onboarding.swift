//
//  Onboarding.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

enum Onboarding: String, Identifiable, CaseIterable {
    case item1, item2, item3
    
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .item1: return SFSymbols.cake
        case .item2: return SFSymbols.pencilRuler
        case .item3: return SFSymbols.share
        }
    }
    
    var header: String {
        switch self {
        case .item1: return Strings.onboardingHeader1
        case .item2: return Strings.onboardingHeader2
        case .item3: return Strings.onboardingHeader3
        }
    }
    
    var detail: String {
        switch self {
        case .item1: return Strings.onboardingDetail1
        case .item2: return Strings.onboardingDetail2
        case .item3: return Strings.onboardingDetail3
        }
    }
}
