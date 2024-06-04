//
//  DetailRecipe.swift
//  NutriMate_v1
//
//  Created by zenzen on 03/06/24.
//

import SwiftUI

struct DetailRecipe: View {
    let recipe: Recipes
    var body: some View {
            ScrollView {
                VStack {
                    Text("Roasted Lamb Rump with Sweet Peas and Mint Salsa")
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .padding()

                    Image("\(recipe.name)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 360)
                        .padding()

                    HStack(spacing: 10) {
                        VStack {
                            Text("Serves")
                                .font(.headline)
                            Spacer()
                                .frame(height: 16)
                            Text("4")
                                .font(.subheadline)
                        }
                        

                        Rectangle()
                            .frame(width: 1, height: 50)
                            .foregroundColor(.black)

                        VStack {
                            Text("Prep Time")
                                .font(.headline)
                            Spacer()
                                .frame(height: 16)
                            Text("20 Mins")
                                .font(.subheadline)
                        }

                        Rectangle()
                            .frame(width: 1, height: 50)
                            .foregroundColor(.black)

                        VStack {
                            Text("Cook Time")
                                .font(.headline)
                            Spacer()
                                .frame(height: 16)
                            Text("\(recipe.cookTime) Mins")
                                .font(.subheadline)
                        }

                        Rectangle()
                            .frame(width: 1, height: 50)
                            .foregroundColor(.black)

                        VStack {
                            Text("\(recipe.calories)")
                                .font(.headline)
                            Spacer()
                                .frame(height: 16)
                            Text("570 kkal")
                                .font(.subheadline)
                        }
                        
                    }
                    .padding(.top, 20)
                    

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(hex: 0xeeeeee))
                            .frame(width: 360, height: 520)

                        VStack(alignment: .leading) {
                            
                            Text("Ingredients")
                                .font(.headline)
                                .padding(.bottom, 5)
                                

                            Text("4 x 200g lamb rumps")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("1 tbs vegetable oil")
                                .font(.subheadline)
                                .padding(.bottom, 5)

                            Text("Sweet Pea Salad")
                                .font(.headline)
                                .padding(.bottom, 5)
                            Text("200g podded fresh or frozen peas")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("200g snow peas halved")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("50g snow pea tendrils")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("100g marinated feta, drained and crumbled")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("1/4 red onion, sliced")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("2 pcs preserved lemon, rind only, rinsed and sliced")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("Lemon Juice")
                                .font(.subheadline)
                                .padding(.bottom, 2)

                            Text("Mint Salsa")
                                .font(.headline)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            Text("1 1/2 cups mint leaves")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("1/2 cup flat-leaf parsley leaves")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("1 garlic clove, roughly chopped")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("150ml grapeseed oil")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                            Text("1 1/2 tbs chardonnay vinegar")
                                .font(.subheadline)
                                .padding(.bottom, 2)
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(.leading, 3)
                        .padding()
                    }
                    .padding()
                }
                .padding()
                
                
                VStack(alignment: .leading) {
                    Text("Method")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.bottom, 5)

                    Text("1. Preheat oven to 200°C/180°C fan-forced. Season lamb rumps with salt flakes and freshly ground black pepper.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("2. PHeat oil in a large, ovenproof frypan over medium-high heat, then add lamb, fat-side down, and sear, without touching, for 4 minutes or until the fat renders and is very crisp. ")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("3. urn and cook for 1 minute or until lightly browned on all remaining sides.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("4. Transfer pan to oven and roast for 20-22 minutes until lamb is cooked but still pink in the middle.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("5. ransfer lamb to a plate, then cover loosely with foil and rest for 10 minutes.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("6. Meanwhile, for the mint salsa, whiz all ingredients in a food processor until smooth and combined.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("7. Season with salt flakes and freshly ground black pepper. While the lamb rests, make the sweet pea salad. Bring a medium saucepan of salted water to the boil over high heat.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("8. Blanch peas and snow peas for 1 minute, then drain and refresh in iced water. Drain well and transfer to a salad bowl.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("9. Add the snow pea tendrils, feta, onion, preserved lemon and lemon juice to taste.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("10. Season with salt flakes and freshly ground black pepper, then toss to combine.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("11. Slice each lamb rump. Divide lamb and salad among plates. Spoon a little mint salsa over the lamb, and serve with the remaining salsa alongside.")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                }
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.leading, 40)
                .padding(.trailing, 32)
                
                Button{
                    
                } label: {
                    Text("Select this recipe")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
                
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let sampleRecipe = Recipes(name: "Sample Recipe",
                                        desc: "This is a sample recipe description.",
                                        calories: 200,
                                        fat: 5,
                                        carbs: 30,
                                        protein: 6,
                                        sugar: 20,
                                        cookTime: 15,
                                        ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
                                        steps: ["Step 1", "Step 2", "Step 3"],
                                        image: "sample_image")
            DetailRecipe(recipe: sampleRecipe)
        }
    }

#Preview {
    DetailRecipe(recipe: Recipes(name: "Sample Recipe",
                                      desc: "This is a sample recipe description.",
                                      calories: 200,
                                      fat: 5,
                                      carbs: 30,
                                      protein: 6,
                                      sugar: 20,
                                      cookTime: 15,
                                      ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
                                      steps: ["Step 1", "Step 2", "Step 3"],
                                      image: "sample_image"))
}

