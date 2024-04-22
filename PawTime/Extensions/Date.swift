//
//  Date.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import Foundation

extension Date {
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
