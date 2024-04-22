//
//  CreatePhotoView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct InfoPhotoView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                if let selectedImageData = ageViewModel.selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: Values.photoSize)
                        .clipShape(RoundedBottom())
                } else {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Colors.primaryHighlight)
                            .shadow(color: .black.opacity(0.7), radius: 16, x: 0, y: 0)
                            .clipShape(RoundedBottom())
                        
                        Image(systemName: SFSymbols.cameraFill)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .frame(height: Values.photoSize)
                }
            }
        }
    }
    
}

#Preview {
    InfoPhotoView()
        .environmentObject(AgeViewModel())
}
