//
//  CreateSizeView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct InfoSizeView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    private let gridItems = Array(repeating: GridItem(spacing: Values.minorPadding), count: 2)
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.minorPadding / 2) {
            Text(Strings.size)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, Values.minorPadding)
            
            HStack(spacing: Values.minorPadding) {
                LazyVGrid(columns: gridItems, spacing: Values.minorPadding) {
                    ForEach(DogSize.allCases) { size in
                        SizePicker(selectedSize: $ageViewModel.dogSize, size: size, color: Colors.secondaryBackground)
                    }
                }
            }
        }
    }
    
}

#Preview {
    InfoSizeView()
        .environmentObject(AgeViewModel())
}
