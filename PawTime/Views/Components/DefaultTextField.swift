//
//  DefaultTextField.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct DefaultTextField: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    
    let title: String
    let color: Color
    
    
    
    // MARK: - Body
    
    var body: some View {
        TextField(title, text: $text)
            .multilineTextAlignment(.center)
            .font(.title3)
            .fontWeight(.bold)
            .padding(.vertical, Values.regularPadding / 2)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadius))
            .defaultShadow()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button(action: hideKeyboard) {
                        Image(systemName: SFSymbols.keyboardDown)
                    }
                    .foregroundStyle(Colors.primaryHighlight)
                }
            }
    }
    
}

#Preview {
    DefaultTextField(text: .constant(""), title: "Name", color: Colors.secondaryBackground)
        .padding()
}
