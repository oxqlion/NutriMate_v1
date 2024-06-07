//
//  ListRecipe.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI
import SwiftData

struct MacListsRecipe: View {
    @Environment(\.modelContext) var modelContexts
    @Query var recipes: [Recipes]
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    HStack {
                        Text("Hello Johnny,")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.black))
                            .padding(.leading, 20)
                        
                        MacSearchBar(searchTerm: $searchTerm)
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: geometry.size.width/17, height: geometry.size.height/15)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                            .padding(.trailing, 20)
                    }
                    .background(Color(.white))
                    .frame(height: geometry.size.height/10)
                    
                    Text("Recommended for you")
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                    
                    HStack {
                        Spacer()
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 1) {
                                List {
                                    ForEach(recipes) { recipe in
                                        MacRecipeItem(recipe: recipe, ScreenSize: geometry.size)
                                            .frame(maxHeight: geometry.size.height - geometry.size.height/10)
                                            .padding(.vertical, 65)
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    .background(Color(.systemGray))
                    .cornerRadius(20)
                    .frame(maxWidth: geometry.size.width - geometry.size.width/55, maxHeight: .infinity)
                }
                .background(Color(.systemGray))
            }
        }
    }
}

struct MacSearchBar: View {
    @Binding var searchTerm: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                TextField("Search for Recipe", text: $searchTerm)
                    .font(.system(size: 32))
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.top, 8)
        }
    }
}


struct MacRecipeItem: View {
    let recipe: Recipes
    var ScreenSize: CGSize
    var body: some View {
        NavigationLink(destination: MacDetailRecipe()) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: ScreenSize.width/3.1, height: ScreenSize.height/2)
                .overlay(
                    VStack(spacing: 20) {
                        ZStack(alignment: .topTrailing) {
                            Image(recipe.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                
                                Text("5.0")
                                    .font(.system(size: 24))
                            }
                            .padding(10)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .offset(x: -10, y: 10)
                        }
                        
                        VStack(){
                            VStack{
                                HStack{
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.green)
                                    
                                    Text("\(recipe.cookTime) minutes")
                                        .foregroundStyle(.green)
                                        .font(.system(size: 24))
                                        .padding(.trailing, 10)
                                    
                                    Image(systemName: "flame")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.red)
                                    
                                    Text("\(recipe.calories) kcal")
                                        .font(.system(size: 24))
                                        .foregroundStyle(.red)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            VStack(alignment:.leading){
                                Text(recipe.name)
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Text(recipe.desc)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                )
        }
    }
}




