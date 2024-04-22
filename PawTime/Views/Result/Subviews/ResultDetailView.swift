//
//  ResultDetailView.swift
//  PawTime
//
//  Created by Kaevin on 30.11.23.
//

import SwiftUI

struct ResultDetailView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        if let dogAge = ageViewModel.dogAge, let humanAge = ageViewModel.humanAge {
            ZStack {
                Wave()
                    .stroke(LinearGradient(colors: [Colors.secondaryHighlight, Colors.primaryHighlight],
                                           startPoint: .leading,
                                           endPoint: .trailing), lineWidth: 3)
                    .frame(width: Values.sharingSizeFrame * 0.8, height: Values.sharingSizeFrame)
                    .rotationEffect(.degrees(-45))
                
                VStack(alignment: .leading, spacing: Values.regularPadding / 2) {
                    Text(ageViewModel.dogName)
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        AgeView(species: .dog, age: dogAge)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Images.logo
                        .frame(width: Values.sharingSizeLogo, height: Values.sharingSizeLogo)
                }
                .padding(Values.regularPadding)
                .frame(width: Values.sharingSizeFrame, height: Values.sharingSizeFrame)
                
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    
                    if let selectedImageData = ageViewModel.selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: Values.sharingSizePhoto, height: Values.sharingSizePhoto)
                            .clipShape(Circle())
                            .padding(.trailing, Values.minorPadding)
                            .padding(.bottom, Values.largePadding * 2)
                            .rotationEffect(.degrees(16))
                    }
                    
                    HStack {
                        Spacer()
                        AgeView(species: .human, age: humanAge)
                    }
                }
                .padding(Values.regularPadding)
                .frame(width: Values.sharingSizeFrame, height: Values.sharingSizeFrame)
            }
            .frame(width: Values.sharingSizeFrame, height: Values.sharingSizeFrame)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: Values.cornerRadius)
                    .strokeBorder(LinearGradient(colors: [Colors.secondaryHighlight, Colors.primaryHighlight],
                                                 startPoint: .bottomLeading,
                                                 endPoint: .topTrailing), lineWidth: 5)
            )
        }
    }
    
}

#Preview {
    ResultDetailView()
        .environmentObject(AgeViewModel())
}
