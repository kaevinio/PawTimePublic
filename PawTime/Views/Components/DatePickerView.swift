//
//  DatePickerView.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import SwiftUI

struct DatePickerView: View {
    
    // MARK: - Properties
    
    @Binding var sheet: Sheet?
    @Binding var date: Date
    
    private let lowestDate: Date
    private let highestDate: Date
    
    
    
    // MARK: - Body
    
    init(sheet: Binding<Sheet?>, date: Binding<Date>) {
        self._sheet = sheet
        self._date = date
        
        self.lowestDate = Calendar.current.date(byAdding: .year, value: -16, to: Date()) ?? Date()
        self.highestDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    }
    
    var body: some View {
        VStack(spacing: Values.minorPadding / 2) {
            DatePicker("", selection: $date, in: lowestDate...highestDate, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
            
            SmallButton(title: Strings.done, action: dismiss)
        }
    }
    
    
    
    // MARK: - Functions
    
    private func dismiss() {
        sheet = nil
    }
    
}

#Preview {
    DatePickerView(sheet: .constant(.date), date: .constant(Date()))
}
