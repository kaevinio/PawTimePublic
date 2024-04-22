//
//  Interval.swift
//  PawTime
//
//  Created by Kaevin on 01.12.23.
//

import Foundation

enum Interval {
    case years, months, days
    
    
    var plural: String {
        switch self {
        case .years: return Strings.years
        case .months: return Strings.months
        case .days: return Strings.days
        }
    }
    
    var singular: String {
        switch self {
        case .years: return Strings.year
        case .months: return Strings.month
        case .days: return Strings.day
        }
    }
}
