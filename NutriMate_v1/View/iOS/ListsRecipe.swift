//
//  ListRecipe.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI
import SwiftData

struct ListsRecipe: View {
    @Environment(\.modelContext) var modelContexts
    @Query var recipes: [Recipers]
    @State private var searchTerm = ""
    let isIpad = ScreenSizeDetector().screenWidth > 650
    var filteredRecipes:[Recipes]{
        guard !searchTerm.isEmpty else{return recipess}
        return recipess.filter{ $0.name.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    
    var body: some View {



        //        NavigationView {
        VStack(alignment: .leading) {


            HStack {
                Text("Hello Johnny,")
                    .font(.system(size: isIpad ? 40 : 24))
                    .fontWeight(isIpad ? .bold : .semibold)

                Spacer()
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: isIpad ? 50 : 30, height: isIpad ? 50 : 30)
                    .clipShape(Circle())
                Button("Add Samples", action: addsamples)
                    .font(.system(size: isIpad ? 32 : 20))
                    .fontWeight(isIpad ? .semibold : .medium)
            } .padding(.top,50)
                .padding(.horizontal)


            HStack{
                VStack{
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: isIpad ? 60 : 30, height: isIpad ? 60 : 30)
                    Text("brodda")
                        .font(.system(size: isIpad ? 32 : 20))
                }.padding(.top,0.2)
                //                        .padding(.bottom)
                    .padding(.bottom, isIpad ? 10 : 0)
                    .background(Color(.systemGray6))
            }.padding(.horizontal)



            SearchBar(searchTerm: $searchTerm)
                .padding(.vertical, isIpad ? 10 : 0)
                .padding(.horizontal)

            Text("Recommended for you")
                .font(.system(size: isIpad ? 28 : 16))
            //                    .padding(.top, 24)
                .padding(.horizontal)
                .padding(.bottom, isIpad ? 10 : 0)
            //                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 10)


            List {
                RecipeItem()
                RecipeItem()

                ForEach(recipes){ recipe in
                    NavigationLink(destination: DetailRecipe(recipe: recipe)) {
                        VStack(spacing:20){
                            ZStack(alignment: .topTrailing) {
                                Image(recipe.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(20)

                                HStack {
                                    Image(systemName: "star.fill")

                                    Text("5.0")
                                        .font(.system(size: isIpad ? 24 : 16))
                                }
                                .padding(10)
                                .background(Color.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .offset(x: isIpad ? -10 : 8, y: isIpad ? 10 : 8)
                            }

                            VStack(){
                                VStack{
                                    HStack{
                                        Image(systemName: "clock")
                                            .resizable()
                                            .frame(width: isIpad ? 30 : 20, height: isIpad ? 30 : 20)
                                            .foregroundStyle(.green)

                                        Text("\(recipe.cookTime) minutes")
                                            .foregroundStyle(.green)
                                            .font(.system(size: isIpad ? 24 : 16))
                                            .padding(.trailing, isIpad ? 15 : 0)

                                        Image(systemName: "flame")
                                            .resizable()
                                            .frame(width: isIpad ? 30 : 20, height: isIpad ? 30 : 20)
                                            .foregroundStyle(.red)

                                        Text("\(recipe.calories) kcal")
                                            .font(.system(size: isIpad ? 24 : 16))
                                            .foregroundStyle(.red)
                                    }
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                VStack(alignment:.leading){
                                    Text(recipe.name)
                                        .font(.system(size: isIpad ? 40 : 28))
                                        .fontWeight(isIpad ? .semibold : .medium)
                                    Text(recipe.desc)
                                        .font(.system(size: isIpad ? 24 : 16))
                                        .foregroundStyle(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                    }
                }
            }
            .padding(0)
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            .edgesIgnoringSafeArea(.top)
            .onAppear {
                           if !UserDefaults.standard.bool(forKey: "isDataSeeded") {
                               addsamples()
                               UserDefaults.standard.set(true, forKey: "isDataSeeded")
                           }
                       }
            
        }
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        .edgesIgnoringSafeArea(.top)
        .padding(.horizontal, isIpad ? 8 : 0)


    }
    func addsamples(){
        let fruitsRecipe8 = Recipers(name: "Berry Parfait", desc: "A delicious and healthy berry parfait.", calories: 200, fat: 5, carbs: 30, protein: 6, sugar: 20, cookTime: 5,ingredients: ["strawberi"], steps: ["Layer Greek yogurt, mixed berries, and granola in a glass.", "Repeat the layers.", "Serve immediately."], image: "image 11")

        let fruitsRecipe9 = Recipers(name: "Mango Salsa", desc: "A fresh and tangy mango salsa perfect for summer.", calories: 100, fat: 0, carbs: 25, protein: 1, sugar: 20, cookTime: 10,ingredients: ["strawberi"], steps: ["Combine diced mango, red bell pepper, red onion, and cilantro in a bowl.", "Add lime juice and salt.", "Toss gently and serve chilled."], image: "image 11")
        modelContexts.insert(fruitsRecipe9)
        modelContexts.insert(fruitsRecipe8)
    }

}

struct SearchBar: View {
    @Binding var searchTerm: String
    let isIpad = ScreenSizeDetector().screenWidth > 650

    var body: some View {
        HStack {
            TextField("Search for Recipe", text: $searchTerm)
                .font(.system(size: isIpad ? 24 : 16))
                .padding(8)
                .padding(.vertical, isIpad ? 8 : 0)
                .background(Color(.systemGray5))
                .cornerRadius(8)

        }
    }
}

struct RecipeItem: View {
    let isIpad = ScreenSizeDetector().screenWidth > 650

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
                        .font(.system(size: isIpad ? 24 : 16))
                }
                .padding(10)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .offset(x: isIpad ? -10 : 8, y: isIpad ? 10 : 8)
            }

            VStack(){
                VStack{
                    HStack{
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: isIpad ? 30 : 20, height: isIpad ? 30 : 20)
                            .foregroundStyle(.green)

                        Text("25 minutes")
                            .foregroundStyle(.green)
                            .font(.system(size: isIpad ? 24 : 16))
                            .padding(.trailing, isIpad ? 15 : 0)

                        Image(systemName: "flame")
                            .resizable()
                            .frame(width: isIpad ? 30 : 20, height: isIpad ? 30 : 20)
                            .foregroundStyle(.red)

                        Text("32 kcal")
                            .font(.system(size: isIpad ? 24 : 16))
                            .foregroundStyle(.red)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment:.leading){
                    Text("Brunch is here")
                        .font(.system(size: isIpad ? 40 : 28))
                        .fontWeight(isIpad ? .semibold : .medium)
                    Text("here is a discription")
                        .font(.system(size: isIpad ? 24 : 16))
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)


    }

}

#Preview {
    ListsRecipe()
}
        } .padding(.vertical, 10)
        
    }
    
}

struct RecipePage_Previews: PreviewProvider {
    static var previews: some View {
        ListsRecipe().modelContainer(for: [Recipes.self, DailyStats.self])
    }
}


