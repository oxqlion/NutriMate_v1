//
//  ModelContainers.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 05/06/24.
//

import Foundation
import SwiftData

@MainActor
class SwiftDataContainer {
    static let container: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Recipers.self, DailyStats.self,User.self, configurations: config)
            
            // Seeder
//            container.mainContext.insert(Recipers(name: "Yebol", dailyDone: true, streak: 34, enableTimer: true))
            let fruitsRecipe8 = Recipers(name: "Berry Parfait", desc: "A delicious and healthy berry parfait.", calories: 200, fat: 5, carbs: 30, protein: 6, sugar: 20, cookTime: 5,ingredients: ["strawberi"], steps: ["Layer Greek yogurt, mixed berries, and granola in a glass.", "Repeat the layers.", "Serve immediately."], image: "image 11")

            let fruitsRecipe9 = Recipers(name: "Mango Salsa", desc: "A fresh and tangy mango salsa perfect for summer.", calories: 100, fat: 0, carbs: 25, protein: 1, sugar: 20, cookTime: 10,ingredients: ["strawberi"], steps: ["Combine diced mango, red bell pepper, red onion, and cilantro in a bowl.", "Add lime juice and salt.", "Toss gently and serve chilled."], image: "image 11")
            container.mainContext.insert(fruitsRecipe8)
            return container
        } catch {
            fatalError("Failed to create dummy data~")
        }
    }()
}
