//
//  Wave.swift
//  PawTime
//
//  Created by Kaevin on 01.12.23.
//

import SwiftUI

struct Wave: Shape {
    
    private var frequency: CGFloat = 6
    private var density: CGFloat = 2
    private var phase: CGFloat = 6
    private var normedAmplitude: CGFloat = 0.05
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let maxAmplitude = rect.height / 2.0
        let mid = rect.width / 2
        
        for xValue in Swift.stride(from: 0, to: rect.width + density, by: density) {
            // Parabolic scaling
            let scaling = -pow(1 / mid * (xValue - mid), 2) + 1
            let yValue = scaling * maxAmplitude * normedAmplitude * sin(CGFloat(2 * Double.pi) * self.frequency * (xValue / rect.width)  + self.phase) + rect.height / 2
            
            if xValue == 0 {
                path.move(to: CGPoint(x: xValue, y: yValue))
            } else {
                path.addLine(to: CGPoint(x: xValue, y: yValue))
            }
        }
        
        return path
    }
}


#Preview {
    Wave()
        .foregroundStyle(Colors.primaryHighlight)
        .frame(height: 300)
}
