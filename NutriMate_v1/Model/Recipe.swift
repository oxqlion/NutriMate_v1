//
//  Recipe.swift
//  NutriMate_v1
//
//  Created by zenzen on 28/05/24.
//

import Foundation
import SwiftData

@Model
class Recipers {
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
    var ingredients: [String]
    
    init(name: String="", desc: String="", calories: Int = 0, fat: Int = 0, carbs: Int = 0, protein: Int = 0, sugar: Int = 0, cookTime: Int = 0,ingredients:[String],  steps: [String] = [""], image: String = "" ) {
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
        self.ingredients = ingredients
    }
}
