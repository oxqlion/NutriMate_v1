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
    
    init(name: String="", desc: String="", calories: Int = 0, fat: Int = 0, carbs: Int = 0, protein: Int = 0, sugar: Int = 0, cookTime: Int = 0, ingredients:[String] = [""], steps: [String] = [""], image: String = "" ) {
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

func parseAIResponse(response: String) -> Recipers? {
    let components = response.split(separator: "\n")
    var name = ""
    var desc = ""
    var calories = 0
    var fat = 0
    var carbs = 0
    var protein = 0
    var sugar = 0
    var cookTime = 0
    var steps = [String]()
    var ingredients = [String]()
    
    for i in 0..<components.count {
        let line = components[i].trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line.starts(with: "**Meal Name:**") {
            name = line.replacingOccurrences(of: "**Meal Name:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        } else if line.starts(with: "**Meal Description:**") {
            desc = line.replacingOccurrences(of: "**Meal Description:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        } else if line.starts(with: "**Meal Total Calories:**") {
            if let value = Int(line.replacingOccurrences(of: "**Meal Total Calories:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines)) {
                calories = value
            }
        } else if line.starts(with: "**Meal Total Fat:**") {
            if let value = Int(line.replacingOccurrences(of: "**Meal Total Fat:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "g", with: "")) {
                fat = value
            }
        } else if line.starts(with: "**Meal Total Carbs:**") {
            if let value = Int(line.replacingOccurrences(of: "**Meal Total Carbs:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "g", with: "")) {
                carbs = value
            }
        } else if line.starts(with: "**Meal Total Protein:**") {
            if let value = Int(line.replacingOccurrences(of: "**Meal Total Protein:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "g", with: "")) {
                protein = value
            }
        } else if line.starts(with: "**Meal Total Sugar:**") {
            if let value = Int(line.replacingOccurrences(of: "**Meal Total Sugar:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "g", with: "")) {
                sugar = value
            }
        } else if line.starts(with: "**Meal Cook Time:**") {
            if let value = Int(line.replacingOccurrences(of: "**Meal Cook Time:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "minutes", with: "")) {
                cookTime = value
            }
        } else if line.starts(with: "**Meal Step-by-Step to Make:**") {
            steps = components[(i + 1)...].filter { !$0.starts(with: "**") && !$0.isEmpty }.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        } else if line.starts(with: "**Meal Ingredients:**") {
            ingredients = line.replacingOccurrences(of: "**Meal Ingredients:**", with: "").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "* ").filter { !$0.isEmpty }.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        }
    }
    
    return Recipers(name: name, desc: desc, calories: calories, fat: fat, carbs: carbs, protein: protein, sugar: sugar, cookTime: cookTime, ingredients: ingredients, steps: steps)
}
