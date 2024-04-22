//
//  AgeViewModel.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI
import PhotosUI

class AgeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var avatarItem: PhotosPickerItem?
    @Published var selectedImageData: Data?
    
    @Published var dogSize: DogSize?
    
    @Published var name = ""
    @Published var date = Date()
    
    @Published var showResultView = false
    @Published var isCalculating = false
    @Published var showIsCalculating = false
    @Published var isDoneCalculating = false
    @Published var showConfetti = false
    
    @Published var dogAge: Age?
    @Published var humanAge: Age?
    
    
    var dogName: String {
        name.isEmpty ? Strings.myDog :  name
    }
    
    var day: String {
        date.isToday ? "" : "\(Calendar.current.component(.day, from: date))"
    }
    
    var month: String {
        date.isToday ? "" : "\(Calendar.current.component(.month, from: date))"
    }
    
    var year: String {
        date.isToday ? "" : "\(Calendar.current.component(.year, from: date))"
    }
    
    var enableCalc: Bool {
        dogSize != nil && !date.isToday
    }
    
    
    
    // MARK: - Functions
    
    func calculateAge() {
        guard let dogSize else { return }
        
        let dogYears = CalculationManager.shared.getAge(for: date).rounded(toPlaces: 2)
        let humanYears = CalculationManager.shared.calculateAge(for: dogSize, date: date)
        
        dogAge = CalculationManager.shared.getIntervals(for: dogYears)
        humanAge = CalculationManager.shared.getIntervals(for: humanYears)
        
        withAnimation {
            showResultView = true
            isCalculating = true
            showIsCalculating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.showIsCalculating = false
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.isCalculating = false
                
                self.showConfetti = true
                self.isDoneCalculating = true
                
                FeedbackManager.success()
            }
        }
    }
    
    func resetData() {
        withAnimation {
            showResultView = false
            showIsCalculating = false
            isDoneCalculating = false
            isCalculating = false
            
            avatarItem = nil
            selectedImageData = nil
            
            name = ""
            date = Date()
            dogSize = nil
        }
    }
    
}
