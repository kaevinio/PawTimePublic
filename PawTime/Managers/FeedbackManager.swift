//
//  FeedbackManager.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import UIKit

struct FeedbackManager {
    static func haptics(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    static func success() {
        let feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.notificationOccurred(.success)
    }
}
