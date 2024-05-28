//
//  Recipe.swift
//  NutriMate_v1
//
//  Created by zenzen on 28/05/24.
//

import Foundation
import SwiftData

@Model
class Recipe {
    var name: String
    var desc: String
    var calories: Int
    var fat: Int
    var carbs: Int
    var protein: Int
    var sugar: Int
    var cookTime: Int
    var steps: [String]
    var image: String
    
    init(name: String, desc: String, calories: Int, fat: Int, carbs: Int, protein: Int, sugar: Int, cookTime: Int, steps: [String], image: String) {
        self.name = name
        self.desc = desc
        self.calories = calories
        self.fat = fat
        self.carbs = carbs
        self.protein = protein
        self.sugar = sugar
        self.cookTime = cookTime
        self.steps = steps
        self.image = image
    }
}
