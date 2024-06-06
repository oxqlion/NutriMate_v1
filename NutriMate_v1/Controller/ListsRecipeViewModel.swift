//
//  ListsRecipeViewModel.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 05/06/24.
//

import Foundation
class ListsRecipeViewModel: ObservableObject {
    @Published var recipes: [Recipes] = []
    private let repository = RecipeRepository()
    func seedDataIfNeeded() {
        if !UserDefaults.standard.bool(forKey: "isDataSeeded") {
            repository.addSamples()
            UserDefaults.standard.set(true, forKey: "isDataSeeded")
        }
        recipes = repository.getAllRecipes()
    }
}
