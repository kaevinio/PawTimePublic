//
//  CreateResultView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI
import SPConfetti

struct ResultView: View {
    
    // MARK: - Properties
    
    @Environment(\.displayScale) private var displayScale
    
    @EnvironmentObject private var ageViewModel: AgeViewModel
    
    @State private var renderedImage = Image(systemName: SFSymbols.cameraFill)
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.regularPadding) {
            Spacer()
            
            if ageViewModel.isCalculating {
                ResultAnimationView()
            } else if ageViewModel.isDoneCalculating {
                ResultDetailView()
            }
            
            Spacer()
            
            if ageViewModel.isDoneCalculating {
                ShareLink(item: renderedImage,
                          message: Text(Strings.shareMessage),
                          preview: SharePreview(Strings.shareMessage, image: renderedImage)) {
                    
                    SmallButtonImageTextView(icon: SFSymbols.photo, title: Strings.share, color: Color.secondaryHighlight)
                }
                          .foregroundStyle(.primary)
                
                SmallButton(title: Strings.again, action: ageViewModel.resetData)
                    .padding(.bottom, Values.regularPadding)
            }
        }
        .onChange(of: ageViewModel.isDoneCalculating) { _ in
            render()
        }
        .confetti(isPresented: $ageViewModel.showConfetti,
                  animation: .fullWidthToDown,
                  particles: [.circle, .heart, .star],
                  duration: 3)
        .confettiParticle(\.velocity, 350)
    }
    
    
    
    // MARK: - Functions
    
    @MainActor
    private func render() {
        let renderer = ImageRenderer(content: ResultDetailView().environmentObject(ageViewModel))
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }
    
}

#Preview {
    ResultView()
        .environmentObject(AgeViewModel())
}
