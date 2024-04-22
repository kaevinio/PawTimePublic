//
//  Color.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

enum Threshold {
    static let transparent: CGFloat = 0.2
    static let light: CGFloat = 0.6
}

enum Brightness {
    case light, dark
    
    init(brightness: CGFloat, alpha: CGFloat) {
        self = brightness > Threshold.light || alpha < Threshold.transparent ? .light : .dark
    }
}

extension Color {
    var brightness: Brightness {
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        let uiColor = UIColor(self)
        uiColor.getHue(nil, saturation: nil, brightness: &brightness, alpha: &alpha)
        return .init(brightness: brightness, alpha: alpha)
    }
}
