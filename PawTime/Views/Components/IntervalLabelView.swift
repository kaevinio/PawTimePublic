//
//  IntervalLabelView.swift
//  PawTime
//
//  Created by Kaevin on 01.12.23.
//

import SwiftUI

struct IntervalLabelView: View {
    
    // MARK: - Properties
    
    let amount: Int
    let interval: Interval
    let color: Color
    
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(amount)")
                .font(.system(size: 36))
                .fontWeight(.heavy)
                .foregroundStyle(color)
                .frame(height: 30)
            
            Text((amount > 1 || amount == 0) ? interval.plural : interval.singular)
                .font(.headline)
                .foregroundStyle(color)
            
            Spacer()
        }
        .fixedSize()
    }
    
}

#Preview {
    IntervalLabelView(amount: 1, interval: .years, color: Colors.primaryHighlight)
}
