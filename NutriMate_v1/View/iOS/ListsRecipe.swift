//
//  ListsRecipe.swift
//  NutriMate_v1
//
//  Created by student on 30/05/24.
//

import SwiftUI
import SwiftData

struct ListsRecipe: View {
    @Environment(\.modelContext) var modelContext
    @Query var recipes: [Recipe]
    @State private var searchTerm = ""
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
                    Button("Add Samples", action: addsamples)
                } .padding(.top,50)
            
                .padding(.horizontal)
                HStack{
                    VStack{
                        Image(systemName: "clock")
                        Text("brodda")
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
                    ForEach(recipes){ recipe in
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
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            .edgesIgnoringSafeArea(.top)
            
        }
        .background(Color(.gray))
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.bottom)
    }
    func addsamples(){
        let esteler =  Recipe(name: "Pasta", desc: "Delicious pasta recipe", calories: 300, fat: 10, carbs: 40, protein: 15, sugar: 5, cookTime: 20, steps: ["Step 1", "Step 2", "Step 3"], image: "image 11")
        
        modelContext.insert(esteler)
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
        ListsRecipe()
    }
}


