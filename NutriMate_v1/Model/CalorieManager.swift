//
//  CalorieManager.swift
//  NutriMate_v1
//
//  Created by zenzen on 07/06/24.
//

import Foundation
class CalorieManager: ObservableObject {
    @Published var allowedCalories: Double = 0.0 // Initial value

func calculateAllowedCaloriesPerDay(loseTarget: Int, totalDays: Int, gender: String, age: Int, weight: Double, height: Double, activityLevel: String) {
        let caloriesPerKg = 7700.0
        let totalCaloricDeficit = Double(loseTarget) * caloriesPerKg
        let dailyCaloricDeficit = totalCaloricDeficit / Double(totalDays)
        
        let bmr: Double
        if gender.lowercased() == "male" {
            bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * Double(age))
        } else if gender.lowercased() == "female" {
            bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * Double(age))
        } else {
            bmr = 0.0
        }
        
        let activityMultiplier: Double
        switch activityLevel.lowercased() {
        case "sedentary":
            activityMultiplier = 1.2
        case "lightly active":
            activityMultiplier = 1.375
        case "moderately active":
            activityMultiplier = 1.55
        case "very active":
            activityMultiplier = 1.725
        case "super active":
            activityMultiplier = 1.9
        default:
            activityMultiplier = 0.0
        }
        
        let tdee = bmr * activityMultiplier
        let allowedCaloriesPerDay = tdee - dailyCaloricDeficit
        let minimumCalories = gender.lowercased() == "male" ? 1500.0 : 1200.0
        self.allowedCalories = allowedCaloriesPerDay
    }
}
