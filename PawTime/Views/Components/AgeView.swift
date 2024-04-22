//
//  DogAgeView.swift
//  PawTime
//
//  Created by Kaevin on 01.12.23.
//

import SwiftUI

struct AgeView: View {
    
    // MARK: - Properties
    
    let species: Species
    let age: Age
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: Values.regularPadding / 2) {
            if species == .dog {
                Text("🐶 \(Strings.dogAge)")
            }
            
            VStack(alignment: .leading, spacing: Values.minorPadding / 2) {
                if age.years > 0 {
                    IntervalLabelView(amount: age.years,
                                      interval: .years,
                                      color: species == .dog ? Colors.primaryHighlight : Colors.secondaryHighlight)
                }
                
                IntervalLabelView(amount: age.months,
                                  interval: .months,
                                  color: species == .dog ? Colors.primaryHighlight : Colors.secondaryHighlight)
                
                IntervalLabelView(amount: age.days,
                                  interval: .days,
                                  color: species == .dog ? Colors.primaryHighlight : Colors.secondaryHighlight)
            }
            
            if species == .human {
                Text("👶 \(Strings.humanAge)")
            }
        }
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(.black)
        .fixedSize()
    }
    
}

#Preview {
    AgeView(species: .dog, age: Age(years: 4, months: 2, days: 2))
}
