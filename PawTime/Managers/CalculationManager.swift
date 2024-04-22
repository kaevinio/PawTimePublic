//
//  CalculationManager.swift
//  PawTime
//
//  Created by Kaevin on 29.11.23.
//

import Foundation

class CalculationManager {
    
    static let shared = CalculationManager()
    
    
    
    // MARK: - Properties
    
    private let dogAges: [Float] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    
    
    
    // MARK: - Functions
    
    func calculateAge(for dogSize: DogSize, date: Date) -> Float {
        let currentAge = getAge(for: date)
        let values = getValues(for: currentAge, from: dogSize)
        
        return calculateDogAge(value: currentAge, yValue1: values.y1, yValue2: values.y2, xValue1: values.x1, xValue2: values.x2)
    }
    
    func getAge(for date: Date) -> Float {
        abs(Float(date.timeIntervalSinceNow) / Float.secondsInYear)
    }
    
    func getIntervals(for period: Float) -> Age {
        var float = period * Float.secondsInYear
        
        var years = 0
        var months = 0
        var days = 0
        
        if float >= Float.secondsInYear {
            years = Int(float / Float.secondsInYear)
            float -= Float(years) * Float.secondsInYear
        }
        
        if float >= Float.secondsInMonth {
            months = Int(float / Float.secondsInMonth)
            float -= Float(months) * Float.secondsInMonth
        }
        
        if float >= Float.secondsInDay {
            days = Int(float / Float.secondsInDay)
        }
        
        return Age(years: years, months: months, days: days)
    }

    // Important: Dogs currently can't be older than 16
    private func getValues(for currentAge: Float, from dogSize: DogSize) -> (y1: Float, y2: Float, x1: Float, x2: Float) {
        guard let index = dogAges.firstIndex(where: { $0 > currentAge }) else {
            return (0, 0, 0, 0)
        }
        
        let yValue1 = dogSize.humanAges[index]
        let yValue2 = dogSize.humanAges[index - 1]
        let xValue1 = dogAges[index]
        let xValue2 = dogAges[index - 1]
        
        return (yValue1, yValue2, xValue1, xValue2)
    }

    /**
     Calculate a dog's current age in human years with linear extrapolation.

     - Parameter value: Current age of the dog
     - Parameter y1: The human's lower age
     - Parameter y2: The human's higher age
     - Parameter x1: The dog's lower age
     - Parameter x2: The dog's higher age
     */
    private func calculateDogAge(value: Float, yValue1: Float, yValue2: Float, xValue1: Float, xValue2: Float) -> Float {
        ((yValue2 - yValue1) / (xValue2 - xValue1) * (value - xValue1) + yValue1).rounded(toPlaces: 2)
    }
    
}
