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
    
    @Relationship() var consumed: [Recipe] = []
    
    init(carbs: Int, protein: Int, fat: Int, sugar: Int, totalCalories: Int, date: Date) {
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.sugar = sugar
        self.totalCalories = totalCalories
        self.date = date
    }
}
