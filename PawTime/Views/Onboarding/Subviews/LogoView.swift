//
//  LogoView.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

struct LogoHeader: View {
    
    // MARK: - Properties
    
    let header: String
    
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: Values.minorPadding / 2) {
                Text(header)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("PawTime")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(Colors.primaryHighlight)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Images.logo
                .frame(width: 72, height: 72)
        }
    }
    
}
