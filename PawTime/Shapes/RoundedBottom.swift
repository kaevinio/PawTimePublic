//
//  RoundedBottomView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct RoundedBottom: Shape {
    func path(in rect: CGRect) -> Path {
        let height = rect.size.height
        let width = rect.size.width
        
        let topLeft = CGPoint(x: 0, y: 0)
        let bottomLeft = CGPoint(x: 0, y: height - 48)
        let bottomRight = CGPoint(x: width, y: height - 48)
        let topRight = CGPoint(x: width, y: 0)
        
        let controlPoint = CGPoint(x: width - width / 2, y: height)
        
        
        var path = Path()
        
        path.move(to: topLeft)
        
        path.addLine(to: bottomLeft)
        path.addQuadCurve(to: bottomRight, control: controlPoint)
        path.addLine(to: topRight)
        
        return path
    }
}


#Preview {
    Rectangle()
        .foregroundStyle(Colors.primaryHighlight)
        .frame(height: 300)
        .clipShape(RoundedBottom())
}
