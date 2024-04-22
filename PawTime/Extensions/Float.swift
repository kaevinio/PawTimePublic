//
//  Float.swift
//  PawTime
//
//  Created by Kaevin on 28.11.23.
//

import Foundation

extension Float {
    static let secondsInYear: Float = 31556926
    static let secondsInMonth: Float = 2628288
    static let secondsInDay: Float = 86400
    
    var toPounds: Float {
        (self * 2.20462).rounded(toPlaces: 0)
    }
    
    var cleanValue: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    func rounded(toPlaces places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
