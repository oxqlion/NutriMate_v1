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
    @Query var recipese: [Recipe]
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
                    ForEach(recipese){ recipe in
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
        let fruitsRecipe8 = Recipe(name: "Berry Parfait", desc: "A delicious and healthy berry parfait.", calories: 200, fat: 5, carbs: 30, protein: 6, sugar: 20, cookTime: 5, steps: ["Layer Greek yogurt, mixed berries, and granola in a glass.", "Repeat the layers.", "Serve immediately."], image: "berry_parfait.jpg")

        let fruitsRecipe9 = Recipe(name: "Mango Salsa", desc: "A fresh and tangy mango salsa perfect for summer.", calories: 100, fat: 0, carbs: 25, protein: 1, sugar: 20, cookTime: 10, steps: ["Combine diced mango, red bell pepper, red onion, and cilantro in a bowl.", "Add lime juice and salt.", "Toss gently and serve chilled."], image: "mango_salsa.jpg")

        let fruitsRecipe10 = Recipe(name: "Fruit Salad", desc: "A refreshing and colorful fruit salad.", calories: 150, fat: 0, carbs: 38, protein: 2, sugar: 30, cookTime: 10, steps: ["Combine diced watermelon, strawberries, blueberries, and kiwi in a bowl.", "Add a squeeze of lime juice.", "Toss gently and serve chilled."], image: "fruit_salad.jpg")

        let fruitsRecipe11 = Recipe(name: "Watermelon Salad", desc: "A refreshing watermelon salad with feta and mint.", calories: 150, fat: 8, carbs: 18, protein: 4, sugar: 10, cookTime: 10, steps: ["Cube watermelon and place in a bowl.", "Add crumbled feta cheese and fresh mint leaves.", "Drizzle with olive oil and balsamic glaze.", "Toss gently and serve chilled."], image: "watermelon_salad.jpg")

        let fruitsRecipe12 = Recipe(name: "Apple Crumble", desc: "A warm and comforting apple crumble with a crunchy topping.", calories: 350, fat: 15, carbs: 50, protein: 5, sugar: 30, cookTime: 60, steps: ["Preheat oven to 375°F (190°C).", "Mix sliced apples with sugar, cinnamon, and lemon juice.", "Transfer to a baking dish.", "Mix flour, oats, brown sugar, and butter to make the crumble topping.", "Sprinkle over the apples.", "Bake for 40-45 minutes until golden brown.", "Serve warm, with vanilla ice cream if desired."], image: "apple_crumble.jpg")

        let fruitsRecipe13 = Recipe(name: "Berry Smoothie Bowl", desc: "A thick and delicious berry smoothie bowl topped with fresh fruits and nuts.", calories: 300, fat: 10, carbs: 45, protein: 8, sugar: 30, cookTime: 5, steps: ["Blend mixed berries, banana, and almond milk until smooth.", "Pour into a bowl.", "Top with fresh berries, granola, and sliced almonds.", "Serve immediately."], image: "berry_smoothie_bowl.jpg")

        let fruitsRecipe14 = Recipe(name: "Pineapple Salsa", desc: "A sweet and tangy pineapple salsa perfect for summer.", calories: 100, fat: 0, carbs: 25, protein: 1, sugar: 20, cookTime: 10, steps: ["Combine diced pineapple, red bell pepper, red onion, and cilantro in a bowl.", "Add lime juice and salt.", "Toss gently and serve chilled."], image: "pineapple_salsa.jpg")

        let fruitsRecipe15 = Recipe(name: "Strawberry Shortcake", desc: "A classic and delicious strawberry shortcake.", calories: 350, fat: 15, carbs: 50, protein: 6, sugar: 25, cookTime: 30, steps: ["Preheat oven to 425°F (220°C).", "Mix flour, sugar, baking powder, and salt in a bowl.", "Cut in butter until the mixture resembles coarse crumbs.", "Stir in milk to form a dough.", "Drop spoonfuls of the dough onto a baking sheet.", "Bake for 12-15 minutes until golden brown.", "Slice shortcakes in half and top with whipped cream and strawberries.", "Serve immediately."], image: "strawberry_shortcake.jpg")

        let fruitsRecipe16 = Recipe(name: "Mango Chia Pudding", desc: "A healthy and delicious mango chia pudding.", calories: 200, fat: 8, carbs: 30, protein: 5, sugar: 20, cookTime: 240, steps: ["Mix chia seeds with coconut milk and maple syrup in a bowl.", "Refrigerate for at least 4 hours, stirring occasionally.", "Top with fresh mango puree before serving.", "Serve chilled."], image: "mango_chia_pudding.jpg")

        let fruitsRecipe17 = Recipe(name: "Blueberry Muffins", desc: "Moist and fluffy blueberry muffins.", calories: 250, fat: 10, carbs: 35, protein: 5, sugar: 20, cookTime: 25, steps: ["Preheat oven to 375°F (190°C).", "Mix flour, sugar, baking powder, and salt in a bowl.", "In another bowl, whisk together eggs, milk, and melted butter.", "Stir the wet ingredients into the dry ingredients until just combined.", "Fold in fresh blueberries.", "Spoon batter into muffin cups and bake for 20-25 minutes.", "Serve warm."], image: "blueberry_muffins.jpg")

        let proteinsRecipe8 = Recipe(name: "Quinoa Salad", desc: "A protein-packed quinoa salad with vegetables and a lemon vinaigrette.", calories: 300, fat: 10, carbs: 40, protein: 10, sugar: 5, cookTime: 20, steps: ["Cook quinoa according to package instructions.", "Mix cooked quinoa with diced vegetables and fresh herbs.", "Whisk together lemon juice, olive oil, salt, and pepper to make the vinaigrette.", "Toss the quinoa salad with the vinaigrette.", "Serve chilled or at room temperature."], image: "quinoa_salad.jpg")

        let proteinsRecipe9 = Recipe(name: "Tofu Stir-Fry", desc: "A quick and healthy tofu stir-fry with vegetables.", calories: 250, fat: 10, carbs: 20, protein: 15, sugar: 5, cookTime: 15, steps: ["Press and cube tofu.", "Heat oil in a skillet and sauté tofu until golden brown.", "Add mixed vegetables and cook for 5-7 minutes.", "Stir in soy sauce and sesame oil.", "Serve hot with rice."], image: "tofu_stir_fry.jpg")

        let proteinsRecipe10 = Recipe(name: "Chicken Salad", desc: "A healthy and delicious chicken salad with a light dressing.", calories: 300, fat: 15, carbs: 10, protein: 30, sugar: 5, cookTime: 10, steps: ["Shred cooked chicken breast.", "Mix chicken with diced celery, grapes, and almonds.", "Whisk together Greek yogurt, lemon juice, salt, and pepper for the dressing.", "Toss the chicken mixture with the dressing.", "Serve chilled."], image: "chicken_salad.jpg")

        let proteinsRecipe11 = Recipe(name: "Turkey Meatballs", desc: "Lean and flavorful turkey meatballs.", calories: 200, fat: 10, carbs: 5, protein: 25, sugar: 2, cookTime: 30, steps: ["Preheat oven to 375°F (190°C).", "Mix ground turkey with breadcrumbs, egg, garlic, and parsley.", "Form into meatballs and place on a baking sheet.", "Bake for 20-25 minutes until cooked through.", "Serve hot with marinara sauce."], image: "turkey_meatballs.jpg")

        let proteinsRecipe12 = Recipe(name: "Lentil Soup", desc: "A hearty and nutritious lentil soup.", calories: 250, fat: 5, carbs: 40, protein: 15, sugar: 5, cookTime: 45, steps: ["Heat oil in a pot and sauté onions, garlic, and carrots.", "Add lentils, vegetable broth, and tomatoes.", "Bring to a boil and then simmer for 30-35 minutes until lentils are tender.", "Season with salt, pepper, and cumin.", "Serve hot."], image: "lentil_soup.jpg")

        let proteinsRecipe13 = Recipe(name: "Black Bean Tacos", desc: "Healthy and delicious black bean tacos.", calories: 300, fat: 10, carbs: 40, protein: 12, sugar: 5, cookTime: 15, steps: ["Heat oil in a skillet and sauté onions and garlic.", "Add black beans and season with cumin, chili powder, salt, and pepper.", "Cook for 5-7 minutes.", "Serve in taco shells with your favorite toppings."], image: "black_bean_tacos.jpg")
        
        let proteinsRecipe14 = Recipe(name: "Chickpea Salad", desc: "A refreshing and protein-packed chickpea salad.", calories: 250, fat: 10, carbs: 30, protein: 10, sugar: 5, cookTime: 10, steps: ["Mix chickpeas with diced cucumbers, tomatoes, red onions, and parsley.", "Whisk together olive oil, lemon juice, salt, and pepper for the dressing.", "Toss the chickpea salad with the dressing.", "Serve chilled or at room temperature."], image: "chickpea_salad.jpg")

        let proteinsRecipe15 = Recipe(name: "Salmon with Asparagus", desc: "Baked salmon fillets with roasted asparagus.", calories: 400, fat: 20, carbs: 10, protein: 40, sugar: 2, cookTime: 25, steps: ["Preheat oven to 375°F (190°C).", "Season salmon fillets with olive oil, salt, pepper, and lemon juice.", "Place on a baking sheet.", "Toss asparagus with olive oil, salt, and pepper.", "Arrange around the salmon.", "Bake for 15-20 minutes until salmon is cooked through.", "Serve hot."], image: "salmon_with_asparagus.jpg")

        let proteinsRecipe16 = Recipe(name: "Grilled Chicken Breast", desc: "Juicy and flavorful grilled chicken breast.", calories: 300, fat: 10, carbs: 0, protein: 40, sugar: 0, cookTime: 20, steps: ["Preheat grill to medium-high heat.", "Season chicken breast with olive oil, salt, pepper, and your favorite herbs.", "Grill for 6-8 minutes per side until cooked through.", "Serve hot with a side of vegetables."], image: "grilled_chicken_breast.jpg")

        let proteinsRecipe17 = Recipe(name: "Egg Salad", desc: "A simple and classic egg salad.", calories: 200, fat: 15, carbs: 2, protein: 10, sugar: 1, cookTime: 10, steps: ["Chop hard-boiled eggs.", "Mix eggs with mayonnaise, mustard, salt, and pepper.", "Serve on bread or with crackers."], image: "egg_salad.jpg")

        let milkRecipe8 = Recipe(name: "Milk and Honey Smoothie", desc: "A simple and nutritious smoothie with milk and honey.", calories: 200, fat: 5, carbs: 30, protein: 10, sugar: 25, cookTime: 5, steps: ["Combine milk, banana, honey, and vanilla extract in a blender.", "Blend until smooth.", "Pour into a glass.", "Serve immediately."], image: "milk_honey_smoothie.jpg")

        let milkRecipe9 = Recipe(name: "Creamy Mushroom Soup", desc: "A rich and creamy mushroom soup.", calories: 300, fat: 20, carbs: 20, protein: 8, sugar: 6, cookTime: 40, steps: ["Sauté onions, garlic, and mushrooms in butter.", "Add flour and cook for 2 minutes.", "Stir in chicken broth and bring to a boil.", "Simmer for 20 minutes.", "Blend until smooth.", "Stir in cream and season with salt and pepper.", "Serve hot."], image: "creamy_mushroom_soup.jpg")

        let milkRecipe10 = Recipe(name: "Cheesy Garlic Bread", desc: "Crispy garlic bread topped with melted cheese.", calories: 250, fat: 15, carbs: 20, protein: 8, sugar: 2, cookTime: 15, steps: ["Preheat oven to 375°F (190°C).", "Mix butter with garlic and spread on bread slices.", "Top with shredded cheese.", "Bake for 10-12 minutes until cheese is melted and bubbly.", "Serve hot."], image: "cheesy_garlic_bread.jpg")

        let milkRecipe11 = Recipe(name: "Mashed Potatoes", desc: "Creamy and buttery mashed potatoes.", calories: 300, fat: 15, carbs: 40, protein: 5, sugar: 2, cookTime: 30, steps: ["Boil potatoes until tender.", "Mash with butter, milk, salt, and pepper.", "Serve hot."], image: "mashed_potatoes.jpg")

        let milkRecipe12 = Recipe(name: "Alfredo Sauce", desc: "A rich and creamy Alfredo sauce for pasta.", calories: 400, fat: 30, carbs: 10, protein: 10, sugar: 2, cookTime: 15, steps: ["Melt butter in a saucepan.", "Stir in heavy cream and bring to a simmer.", "Add Parmesan cheese and garlic.", "Cook until cheese is melted and sauce is thickened.", "Serve hot over pasta."], image: "alfredo_sauce.jpg")

        let milkRecipe13 = Recipe(name: "Banana Milkshake", desc: "A creamy and delicious banana milkshake.", calories: 250, fat: 8, carbs: 40, protein: 8, sugar: 30, cookTime: 5, steps: ["Combine milk, banana, and ice cream in a blender.", "Blend until smooth.", "Pour into a glass.", "Serve immediately."], image: "banana_milkshake.jpg")

        let milkRecipe14 = Recipe(name: "Mac and Cheese", desc: "A classic and comforting macaroni and cheese.", calories: 500, fat: 25, carbs: 50, protein: 15, sugar: 5, cookTime: 30, steps: ["Cook macaroni according to package instructions.", "Make a cheese sauce by melting butter and stirring in flour and milk.", "Add shredded cheese and cook until melted.", "Stir in cooked macaroni.", "Serve hot."], image: "mac_and_cheese.jpg")

        let milkRecipe15 = Recipe(name: "Creamed Spinach", desc: "A rich and creamy spinach side dish.", calories: 200, fat: 15, carbs: 10, protein: 5, sugar: 2, cookTime: 20, steps: ["Sauté spinach in butter.", "Stir in cream and cook until thickened.", "Season with salt, pepper, and nutmeg.", "Serve hot."], image: "creamed_spinach.jpg")

        let milkRecipe16 = Recipe(name: "Rice Pudding", desc: "A creamy and comforting rice pudding.", calories: 250, fat: 8, carbs: 40, protein: 6, sugar: 20, cookTime: 45, steps: ["Cook rice in milk with sugar and vanilla extract.", "Simmer until thickened.", "Serve warm or chilled, topped with cinnamon."], image: "rice_pudding.jpg")

        let milkRecipe17 = Recipe(name: "Broccoli Cheddar Soup", desc: "A rich and creamy broccoli cheddar soup.", calories: 400, fat: 25, carbs: 30, protein: 15, sugar: 5, cookTime: 30, steps: ["Sauté onions and garlic in butter.", "Add chopped broccoli and cook until tender.", "Stir in flour and cook for 1 minute.", "Gradually whisk in chicken broth and milk.", "Simmer until thickened.", "Stir in shredded cheddar cheese until melted.", "Season with salt and pepper.", "Serve hot."], image: "broccoli_cheddar_soup.jpg")

        let herbsRecipe8 = Recipe(name: "Herb-Crusted Salmon", desc: "Salmon fillets coated in a flavorful herb crust.", calories: 350, fat: 20, carbs: 5, protein: 35, sugar: 1, cookTime: 20, steps: ["Preheat oven to 400°F (200°C).", "Mix breadcrumbs with chopped herbs, garlic, and olive oil.", "Press the mixture onto salmon fillets.", "Bake for 15-20 minutes until salmon is cooked through.", "Serve hot."], image: "herb_crusted_salmon.jpg")

        let herbsRecipe9 = Recipe(name: "Caprese Salad", desc: "A classic Caprese salad with fresh tomatoes, mozzarella, and basil.", calories: 250, fat: 20, carbs: 5, protein: 15, sugar: 3, cookTime: 10, steps: ["Slice tomatoes and mozzarella cheese.", "Arrange on a plate with fresh basil leaves.", "Drizzle with balsamic glaze and olive oil.", "Season with salt and pepper.", "Serve chilled."], image: "caprese_salad.jpg")

        let herbsRecipe10 = Recipe(name: "Garlic Herb Shrimp", desc: "Succulent shrimp cooked with garlic and herbs.", calories: 200, fat: 10, carbs: 5, protein: 25, sugar: 1, cookTime: 10, steps: ["Heat olive oil in a skillet.", "Add minced garlic and cook until fragrant.", "Add shrimp and chopped herbs.", "Sauté until shrimp is pink and cooked through.", "Season with salt and pepper.", "Serve hot."], image: "garlic_herb_shrimp.jpg")

        let herbsRecipe11 = Recipe(name: "Herb Butter", desc: "A flavorful herb butter perfect for spreading or cooking.", calories: 100, fat: 10, carbs: 0, protein: 0, sugar: 0, cookTime: 10, steps: ["Mix softened butter with chopped herbs and garlic.", "Shape into a log and wrap in plastic wrap.", "Refrigerate until firm.", "Serve with bread or use in cooking."], image: "herb_butter.jpg")

        let herbsRecipe12 = Recipe(name: "Herb Salad", desc: "A fresh and flavorful herb salad.", calories: 100, fat: 5, carbs: 10, protein: 2, sugar: 3, cookTime: 10, steps: ["Combine mixed greens with fresh herbs.", "Whisk together olive oil, lemon juice, salt, and pepper for the dressing.", "Toss the salad with the dressing.", "Serve immediately."], image: "herb_salad.jpg")

        let herbsRecipe13 = Recipe(name: "Herb-Marinated Grilled Vegetables", desc: "Grilled vegetables with a flavorful herb marinade.", calories: 150, fat: 10, carbs: 15, protein: 2, sugar: 5, cookTime: 30, steps: ["Combine olive oil, lemon juice, garlic, and chopped herbs for the marinade.", "Toss vegetables with the marinade.", "Grill for 10-15 minutes until tender.", "Serve hot."], image: "herb_marinated_grilled_vegetables.jpg")

        let herbsRecipe14 = Recipe(name: "Herb-Crusted Lamb Chops", desc: "Lamb chops with a flavorful herb crust.", calories: 400, fat: 30, carbs: 5, protein: 30, sugar: 0, cookTime: 20, steps: ["Preheat oven to 400°F (200°C).", "Mix breadcrumbs with chopped herbs, garlic, and olive oil.", "Press the mixture onto lamb chops.", "Bake for 15-20 minutes until cooked through.", "Serve hot with mint jelly."], image: "herb_crusted_lamb_chops.jpg")

        let herbsRecipe15 = Recipe(name: "Herb-Roasted Potatoes", desc: "Crispy and flavorful herb-roasted potatoes.", calories: 200, fat: 10, carbs: 25, protein: 2, sugar: 2, cookTime: 45, steps: ["Preheat oven to 425°F (220°C).", "Toss potato wedges with olive oil, salt, pepper, and chopped herbs.", "Roast for 35-40 minutes until crispy.", "Serve hot."], image: "herb_roasted_potatoes.jpg")

        let herbsRecipe16 = Recipe(name: "Herb Rice Pilaf", desc: "A flavorful herb rice pilaf.", calories: 250, fat: 10, carbs: 35, protein: 5, sugar: 2, cookTime: 30, steps: ["Sauté onions and garlic in butter.", "Add rice and cook until lightly toasted.", "Stir in chicken broth and fresh herbs.", "Simmer until rice is tender.", "Serve hot."], image: "herb_rice_pilaf.jpg")

        let herbsRecipe17 = Recipe(name: "Herb Baked Eggs", desc: "Eggs baked with a blend of fresh herbs.", calories: 200, fat: 15, carbs: 2, protein: 12, sugar: 1, cookTime: 15, steps: ["Preheat oven to 375°F (190°C).", "Crack eggs into a baking dish.", "Sprinkle with chopped herbs, salt, and pepper.", "Bake for 10-12 minutes until eggs are set.", "Serve hot."], image: "herb_baked_eggs.jpg")
        
        modelContext.insert(proteinsRecipe13)
        modelContext.insert(fruitsRecipe9)
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


