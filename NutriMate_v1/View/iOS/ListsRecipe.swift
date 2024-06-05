//
//  ListsRecipe.swift
//  NutriMate_v1
//
//  Created by student on 30/05/24.
//

import SwiftUI
import SwiftData

struct ListsRecipe: View {
    @Environment(\.modelContext) var modelContexts
    @Query var recipess: [Recipers]
    @Query var dailystats: [DailyStats]
    @State private var searchTerm = ""
    var filteredRecipes:[Recipers]{
        guard !searchTerm.isEmpty else{return recipess}
        return recipess.filter{ $0.name.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Hello Johnny,")
                        .font(.title)
                       
                    Spacer()
                    Spacer()
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                } .padding(.top,50)
            
                .padding(.horizontal)
                HStack{
                        VStack{
                            Image(systemName: "clock")
                            Button("Show details"){
                                
                            }
                        }.padding(.top,0.2)
                            .padding(.bottom)
                            .background(Color(.systemGray6))
                }.padding(.horizontal)
                    
                
                SearchBar(searchTerm: $searchTerm)
                    .padding(.horizontal)
                
                Text("Recommended for you")
                    .font(.subheadline)
                    .padding(.horizontal)
                
                
                List {
                    ForEach(filteredRecipes){ recipe in
                        NavigationLink(destination: DetailRecipe(recipe: recipe).modelContainer(for: DailyStats.self)) {
                            VStack(spacing:20){
                                ZStack(alignment: .topTrailing) {
                                    Image(recipe.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(20)
                                    
                                    HStack {
                                        Image(systemName: "star.fill")
                                        Text("5.0")
                                    }
                                    .padding(6)
                                    .background(Color.yellow)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .offset(x: -8, y: 8)
                                }
                                
                                VStack(){
                                    VStack{
                                        HStack{
                                            Image(systemName: "clock").foregroundStyle(.green)
                                            Text("\(recipe.cookTime) minutes").foregroundStyle(.green)
                                            
                                            Image(systemName: "flame").foregroundStyle(.red)
                                            Text("\(recipe.calories) kcal")
                                                .foregroundStyle(.red)
                                        }
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    VStack(alignment:.leading){
                                        Text(recipe.name).font(.title)
                                        Text(recipe.desc).font(.caption2).foregroundStyle(.gray)
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                }
                            } .padding(.vertical, 10)
                        }
                    }
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            .edgesIgnoringSafeArea(.top)
            .onAppear {
                addsamples()
                           if !UserDefaults.standard.bool(forKey: "isDataSeeded") {
                               addsamples()
                               UserDefaults.standard.set(true, forKey: "isDataSeeded")
                           }
                       }
            
        }
        .background(Color(.gray))
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.bottom)
    }
    func addsamples(){
        let fruitsRecipe8 = Recipers(name: "Berry Parfait", desc: "A delicious and healthy berry parfait.", calories: 200, fat: 5, carbs: 30, protein: 6, sugar: 20, cookTime: 5,ingredients: ["strawberi"], steps: ["Layer Greek yogurt, mixed berries, and granola in a glass.", "Repeat the layers.", "Serve immediately."], image: "image 11")

        let fruitsRecipe9 = Recipers(name: "Mango Salsa", desc: "A fresh and tangy mango salsa perfect for summer.", calories: 100, fat: 0, carbs: 25, protein: 1, sugar: 20, cookTime: 10,ingredients: ["strawberi"], steps: ["Combine diced mango, red bell pepper, red onion, and cilantro in a bowl.", "Add lime juice and salt.", "Toss gently and serve chilled."], image: "image 11")
        modelContexts.insert(fruitsRecipe8)
        let newDailyStats = DailyStats(carbs: 0, protein: 0, fat: 0, sugar: 0, totalCalories: 0, date: Date())
        modelContexts.insert(newDailyStats)
    }
    
}

struct SearchBar: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            TextField("Search for Recipe", text: $searchTerm)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
            
        }
    }
}
struct RecipeItem: View {
    var body: some View {
        VStack(spacing:20){
            ZStack(alignment: .topTrailing) {
                Image("image 11")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                
                HStack {
                    Image(systemName: "star.fill")
                    Text("5.0")
                }
                .padding(6)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .offset(x: -8, y: 8)
            }
            
            VStack(){
                VStack{
                    HStack{
                        Image(systemName: "clock").foregroundStyle(.green)
                        Text("25 minutes").foregroundStyle(.green)
                        
                        Image(systemName: "flame").foregroundStyle(.red)
                        Text("32 kcal")
                            .foregroundStyle(.red)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment:.leading){
                    Text("Brunch is here").font(.title)
                    Text("here is a discription").font(.caption2).foregroundStyle(.gray)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        } .padding(.vertical, 10)
        
    }
    
}

struct RecipePage_Previews: PreviewProvider {
    static var previews: some View {
        ListsRecipe().modelContainer(for: [Recipers.self, DailyStats.self])
    }
}


