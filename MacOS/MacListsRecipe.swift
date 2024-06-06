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
    @Query var recipes: [Recipers]
    @State private var searchTerm = ""
    
    var body: some View {
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
                    //                        .padding(.trailing, 10)
                    //                    Button("Add Samples", action: addsamples)
                    //                        .font(.system(size: 50))
                    //                        .foregroundColor(.black)
                    //                        .fontWeight(.semibold)
                        .padding(.trailing, 20)
                }
                .background(Color(.white))
                .frame(height: geometry.size.height/10)
                
                
                //                HStack{
                ////                    VStack{
                ////                        Image(systemName: "clock")
                ////                            .resizable()
                ////                            .frame(width: geometry.size.width/3, height: geometry.size.height/3)
                ////                        Text("brodda")
                ////                            .font(.system(size: geometry.size.height/10))
                ////                    }.padding(.top,0.2)
                //                    //                        .padding(.bottom)
                ////                        .padding(.bottom, geometry.size.height/20)
                ////                        .background(Color(.systemGray))
                //                }.padding(.horizontal)
                
                
                
                
                
                Text("Recommended for you")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                
                
                HStack {
                    Spacer()
                    Spacer()
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 10)
                        {
                            MacRecipeItem(ScreenSize: geometry.size)
                            MacRecipeItem(ScreenSize: geometry.size)
                            MacRecipeItem(ScreenSize: geometry.size)
                            MacRecipeItem(ScreenSize: geometry.size)
                            MacRecipeItem(ScreenSize: geometry.size)
                            MacRecipeItem(ScreenSize: geometry.size)
                            
                            
                            //                            ForEach(recipes){ recipe in
                            //                                NavigationLink(destination: DetailRecipe(recipe: recipe)) {
                            //                                    RoundedRectangle(cornerRadius: 20)
                            //                                        .fill(Color.white)
                            //                                        .frame(width: geometry.size.width/3.1, height: geometry.size.height/2)
                            //                                        .overlay(
                            //                                            VStack(spacing: 20) {
                            //                                                ZStack(alignment: .topTrailing) {
                            //                                                    Image("image 11")
                            //                                                        .resizable()
                            //                                                        .aspectRatio(contentMode: .fit)
                            //                                                        .cornerRadius(20)
                            //
                            //                                                    HStack {
                            //                                                        Image(systemName: "star.fill")
                            //
                            //                                                        Text("5.0")
                            //                                                            .font(.system(size: 24))
                            //                                                    }
                            //                                                    .padding(10)
                            //                                                    .background(Color.yellow)
                            //                                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                            //                                                    .offset(x: -10, y: 10)
                            //                                                }
                            //
                            //                                                VStack(){
                            //                                                    VStack{
                            //                                                        HStack{
                            //                                                            Image(systemName: "clock")
                            //                                                                .resizable()
                            //                                                                .frame(width: 30, height: 30)
                            //                                                                .foregroundStyle(.green)
                            //
                            //                                                            Text("25 minutes")
                            //                                                                .foregroundStyle(.green)
                            //                                                                .font(.system(size: 24))
                            //                                                                .padding(.trailing, 10)
                            //
                            //                                                            Image(systemName: "flame")
                            //                                                                .resizable()
                            //                                                                .frame(width: 30, height: 30)
                            //                                                                .foregroundStyle(.red)
                            //
                            //                                                            Text("32 kcal")
                            //                                                                .font(.system(size: 24))
                            //                                                                .foregroundStyle(.red)
                            //                                                        }
                            //                                                    }.frame(maxWidth: .infinity, alignment: .leading)
                            //                                                    VStack(alignment:.leading){
                            //                                                        Text("Brunch is here")
                            //                                                            .font(.system(size: 30))
                            //                                                            .fontWeight(.semibold)
                            //                                                            .foregroundColor(.black)
                            //                                                        Text("here is a description")
                            //                                                            .font(.system(size: 16))
                            //                                                            .foregroundStyle(.gray)
                            //                                                    }
                            //                                                    .frame(maxWidth: .infinity, alignment: .leading)
                            //                                                }
                            //                                            }
                            //                                                .padding(.vertical, 10)
                            //                                                .padding(.horizontal, 10)
                            //                                        )
                            //                                }
                            //                            }
                            //                    .padding()
                                .frame(maxHeight: geometry.size.height - geometry.size.height/10)
                                .padding(.vertical, 65)
                        }
                        Spacer()
                    }
                    
                }
                .background(Color(.systemGray))
                .cornerRadius(20)
                //            .navigationBarHidden(true)
                //            .edgesIgnoringSafeArea(.bottom)
                //            .edgesIgnoringSafeArea(.top)
                .frame(maxHeight: .infinity)
            }
            .background(Color(.systemGray))
            
        }
        
        //        func addsamples(){
        //            let fruitsRecipe8 = Recipers(name: "Berry Parfait", desc: "A delicious and healthy berry parfait.", calories: 200, fat: 5, carbs: 30, protein: 6, sugar: 20, cookTime: 5,ingredients: ["strawberi"], steps: ["Layer Greek yogurt, mixed berries, and granola in a glass.", "Repeat the layers.", "Serve immediately."], image: "image 11")
        //
        //            let fruitsRecipe9 = Recipers(name: "Mango Salsa", desc: "A fresh and tangy mango salsa perfect for summer.", calories: 100, fat: 0, carbs: 25, protein: 1, sugar: 20, cookTime: 10,ingredients: ["strawberi"], steps: ["Combine diced mango, red bell pepper, red onion, and cilantro in a bowl.", "Add lime juice and salt.", "Toss gently and serve chilled."], image: "image 11")
        //            modelContexts.insert(fruitsRecipe9)
        //            modelContexts.insert(fruitsRecipe8)
        //        }
        
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
        var ScreenSize: CGSize
        var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: ScreenSize.width/3.1, height: ScreenSize.height/2)
                .overlay(
                    VStack(spacing: 20) {
                        ZStack(alignment: .topTrailing) {
                            Image("image 11")
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
                                    
                                    Text("25 minutes")
                                        .foregroundStyle(.green)
                                        .font(.system(size: 24))
                                        .padding(.trailing, 10)
                                    
                                    Image(systemName: "flame")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.red)
                                    
                                    Text("32 kcal")
                                        .font(.system(size: 24))
                                        .foregroundStyle(.red)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            VStack(alignment:.leading){
                                Text("Brunch is here")
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Text("here is a description")
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

    
    #Preview {
        MacListsRecipe()
    }

