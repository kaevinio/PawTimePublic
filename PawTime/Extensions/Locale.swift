//
//  Locale.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import Foundation

extension Locale {
    static var metricsSystem: Bool {
        current.measurementSystem == .metric
    }
}
