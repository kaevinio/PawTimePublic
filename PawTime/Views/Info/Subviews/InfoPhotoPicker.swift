//
//  CreatePhotoPicker.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI
import PhotosUI

struct InfoPhotoPicker: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        PhotosPicker(selection: $ageViewModel.avatarItem, matching: .images, photoLibrary: .shared()) {
            Rectangle()
                .foregroundStyle(.white.opacity(0.00001))
        }
        .frame(height: Values.photoSize * 0.8)
        .onChange(of: ageViewModel.avatarItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    ageViewModel.selectedImageData = data
                }
            }
        }
    }
    
}
