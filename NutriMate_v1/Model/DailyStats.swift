//
//  DailyStats.swift
//  NutriMate_v1
//
//  Created by zenzen on 28/05/24.
//

import Foundation
import SwiftData

@Model
class DailyStats {
    var carbs: Int
    var protein: Int
    var fat: Int
    var sugar: Int
    var totalCalories: Int
    var date: Date
    
    @Relationship() var consumed: [Recipers] = []
    
    init(carbs: Int = 0, protein: Int = 0, fat: Int = 0, sugar: Int = 0, totalCalories: Int = 0, date: Date) {
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.sugar = sugar
        self.totalCalories = totalCalories
        self.date = date
    }
}
