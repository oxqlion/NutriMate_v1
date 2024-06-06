//////
//////  DetailRecipe.swift
//////  NutriMate_v1
//////
//////  Created by zenzen on 03/06/24.
//////
////
////import SwiftUI
////import SwiftData
////
////struct MacDetailRecipe: View {
////    let recipe: Recipes
//@Environment(\.modelContext) var modelContexts
//@Query var dailystats: [DailyStats]
////    @EnvironmentObject var viewModel: DetailRecipeViewModel
//var body: some View {
//    ScrollView {
//        VStack {
//            Text("\(recipe.name)")
//                .font(.system(size: 24))
//                .multilineTextAlignment(.center)
//                .padding()
//            
//            Image("\(recipe.image)")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 360)
//                .padding()
//            
//            HStack(spacing: 10) {
//                VStack {
//                    Text("Serves")
//                        .font(.headline)
//                    Spacer()
//                        .frame(height: 16)
//                    Text("4")
//                        .font(.subheadline)
//                }
//                
//                
//                Rectangle()
//                    .frame(width: 1, height: 50)
//                    .foregroundColor(.black)
//                
//                VStack {
//                    Text("Prep Time")
//                        .font(.headline)
//                    Spacer()
//                        .frame(height: 16)
//                    Text("20 Mins")
//                        .font(.subheadline)
//                }
//                
//                Rectangle()
//                    .frame(width: 1, height: 50)
//                    .foregroundColor(.black)
//                
//                VStack {
//                    Text("Cook Time")
//                        .font(.headline)
//                    Spacer()
//                        .frame(height: 16)
//                    Text("\(recipe.cookTime) Mins")
//                        .font(.subheadline)
//                }
//                
//                Rectangle()
//                    .frame(width: 1, height: 50)
//                    .foregroundColor(.black)
//                
//                VStack {
//                    Text("Calories")
//                        .font(.headline)
//                    Spacer()
//                        .frame(height: 16)
//                    Text("\(recipe.calories) kkal")
//                        .font(.subheadline)
//                }
//                
//            }
//            .padding(.top, 20)
//            
//            
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .foregroundColor(Color(hex: 0xeeeeee))
//                    .frame(width: 360, height: 520)
//                
//                VStack(alignment: .leading) {
//                    
//                    ForEach(recipe.ingredients, id: \.self) { ingredient in
//                        Text(ingredient)
//                            .font(.subheadline)
//                            .padding(.bottom, 2)
//                    }
//                    .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
//                    .padding(.leading, 3)
//                    .padding()
//                }
//                .padding()
//            }
//            .padding()
//            
//            
//            VStack(alignment: .leading) {
//                Text("Method")
//                    .font(.system(size: 24))
//                    .bold()
//                    .padding(.bottom, 5)
//                
//                
//                ForEach(recipe.steps, id: \.self) { steps in
//                    Text(steps)
//                        .font(.subheadline)
//                        .padding(.bottom, 5)
//                }
//            }
//            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
//            .padding(.leading, 40)
//            .padding(.trailing, 32)
//            
//            Button{
//                addsampless()
//                if dailystats.filter({ $0.date == Date() }).isEmpty {
//                    let newDailyStats = DailyStats(carbs: recipe.carbs , protein: recipe.protein, fat: recipe.fat, sugar: recipe.sugar, totalCalories: recipe.calories, date: Date())
////                                newDailyStats.consumed.append(recipe)
//                            modelContexts.insert(newDailyStats)
//                } else {
//                    // DailyStats exist, update the consumed recipes
//                    let todayStats = dailystats.filter({ $0.date == Date() }).first!
//                    todayStats.carbs = todayStats.carbs+recipe.carbs
////                        todayStats.consumed.append(recipe)
//                    do {
//                       try modelContexts.save()
//                       print("Daily Stats saved successfully!")
//                     } catch {
//                       print("Error saving Daily Stats: \(error)")
//                       // Handle the error here, like showing an alert to the user
//                     }
//                }
//            } label: {
//                Text("Select this recipe")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.black)
//                    .cornerRadius(10)
//            }
//            .padding()
//            
//        }
//    }
//}
//func addsampless(){
//    let newDailyStats = DailyStats(carbs: 0, protein: 0, fat: 0, sugar: 0, totalCalories: 0, date: Date())
//    modelContexts.insert(newDailyStats)
//}
//}
//struct ContentView_Previews: PreviewProvider {
//static var previews: some View {
//    let sampleRecipe = Recipes(name: "Sample Recipe",
//                                desc: "This is a sample recipe description.",
//                                calories: 200,
//                                fat: 5,
//                                carbs: 30,
//                                protein: 6,
//                                sugar: 20,
//                                cookTime: 15,
//                                ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
//                                steps: ["Step 1", "Step 2", "Step 3"],
//                                image: "sample_image")
//    DetailRecipe(recipe: sampleRecipe)
//}
//}
//
//#Preview {
//DetailRecipe(recipe: Recipes(name: "Sample Recipe",
//                              desc: "This is a sample recipe description.",
//                              calories: 200,
//                              fat: 5,
//                              carbs: 30,
//                              protein: 6,
//                              sugar: 20,
//                              cookTime: 15,
//                              ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
//                              steps: ["Step 1", "Step 2", "Step 3"],
//                              image: "sample_image"))
//}
