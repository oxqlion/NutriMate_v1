//
//  RecipeController.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 02/06/24.
//

import Foundation

import SwiftData

class RecipeController{
    @Environment(\.modelContext) var modelContext
    @Query var recipes: [Recipe]
    
    
    
}
