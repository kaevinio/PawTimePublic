//
//  SizePicker.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct SizePicker: View {
    
    // MARK: - Properties
    
    @Binding var selectedSize: DogSize?
    
    let size: DogSize
    let color: Color
    
    
    private var minWeight: String {
        let weight = Locale.metricsSystem ? size.weights.0.cleanValue : size.weights.0.toPounds.cleanValue
        return "\(weight)"
    }
    
    private var maxWeight: String {
        let weight = Locale.metricsSystem ? size.weights.1.cleanValue : size.weights.1.toPounds.cleanValue
        return "\(weight)"
    }
    
    private var unit: String {
        Locale.metricsSystem ? "kg" : "lbs"
    }
    
    
    
    // MARK: - Body
    
    var body: some View {
        Button(action: selectSize) {
            VStack(spacing: Values.minorPadding / 4) {
                Text(size.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                
                Text("\(minWeight) - \(maxWeight) \(unit)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, Values.regularPadding / 2)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadius))
            .defaultShadow()
            .overlay {
                RoundedRectangle(cornerRadius: Values.cornerRadius)
                    .strokeBorder(Color.primaryHighlight, lineWidth: selectedSize == size ? 3 : 0)
            }
        }
        .buttonStyle(.plain)
    }
    
    
    
    // MARK: - Functions
    
    private func selectSize() {
        selectedSize = size
        
        FeedbackManager.haptics(style: .light)
    }
    
}

#Preview {
    SizePicker(selectedSize: .constant(.medium), size: .medium, color: Colors.secondaryBackground)
}
