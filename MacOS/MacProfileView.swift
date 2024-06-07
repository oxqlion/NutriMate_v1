//
//  ProfileView.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import Charts
import SwiftData

struct MacProfileView: View {
    @State private var showGraph: Int = 1
    @Environment(\.modelContext) var modelContexts
    @StateObject var calorieManager = CalorieManager()
    @Query var dailystats: [DailyStats]
    @Query var recipes: [Recipes]
    
    var totalCarbs: Double {
        Double(dailystats.filter { $0.isSameDay(as: Date()) }.reduce(0) { $0 + $1.carbs })
    }
    var totalProtein: Double {
        Double(dailystats.filter { $0.isSameDay(as: Date()) }.reduce(0) { $0 + $1.protein})
    }
    var totalSugar: Double{
        Double(dailystats.filter { $0.isSameDay(as: Date()) }.reduce(0) { $0 + $1.sugar})
    }
    var totalfat: Double{
        Double(dailystats.filter { $0.isSameDay(as: Date()) }.reduce(0) { $0 + $1.fat})
    }
    var totalEaten: Double{
        Double(dailystats.filter { $0.isSameDay(as: Date()) }.reduce(0) { $0 + $1.totalCalories})
    }
    func totalEatens(date:Date)->Double{
        return Double(dailystats.filter { $0.isSameDay(as: date) }.reduce(0) { $0 + $1.totalCalories})
    }
    
    var products: [Product] {
        [
            .init(title: "Eaten", revenue: 0.75),
            .init(title: "Cals Left", revenue: 0.25),
        ]
    }
    
    let days = ["Monday", "Tuesday","Wednesday","Thursday", "Friday","Saturday", "Sunday"]

    var body_weight: [Weight] {
      var weights = [Weight]()
      for day in days {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        guard let date = dateFormatter.date(from: day) else { continue }
        weights.append(Weight(name: day, amount: totalEatens(date: date)))
      }
      return weights
    }


    let data = [
        (name: "Cachapa", value: 0.0),
    ]
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center){
                LazyHStack {
                    
                    
                    //DONUT-CHART =================================
                    ZStack {
                        Chart(products) { product in
                            SectorMark(
                                angle: .value(
                                    Text(verbatim: product.title),
                                    product.revenue
                                ),
                                innerRadius: .ratio(0.8)
                            )
                            .foregroundStyle(
                                by: .value(
                                    Text(verbatim: product.title),
                                    product.title
                                )
                            )
                        }
                        .frame(width: geometry.size.height/3.2, height: geometry.size.height/3.2)
                        .padding(.horizontal, 30)
                        VStack {
                            HStack {
                                Text("1350")
                                    .font(.system(size: 48))
                                    .fontWeight(.bold)
                                    .foregroundColor(.blueGreen)
                                Text("/1800")
                                    .font(.system(size: 24))
                            }
                            .padding(.bottom, 15)
                        }
                    }
                    .padding(.horizontal, 60)
                    //=============================================
                    
                    
                    // LINE-CHART =================================
                    ZStack {
                        Chart {
                            ForEach(body_weight) { weight in
                                LineMark(
                                    x: .value("Product", weight.name),
                                    y: .value("Revenue", weight.amount)
                                )
                            }
                            .interpolationMethod(.catmullRom) // Optional: adds smooth curves
                        }
                        .frame(width: geometry.size.height/3.2, height: geometry.size.height/3.2)
                        .padding(.horizontal, 30)
                    }
                    .padding(.horizontal, 60)
                    
                    Button(action: {
                        do {
                            try modelContexts.delete(model: Recipes.self)
                        } catch {
                            print("Failed to delete diet plan.")
                        }
                    }) {
                        Text("Delete Profile")
                            .font(Font.custom("YourFontName", size: 16)) // Change "YourFontName" to the font you want to use
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red) // Change the color according to your UI design
                            .cornerRadius(10) // Adjust as needed for your design
                    }.buttonStyle(PlainButtonStyle())
                    
                }
                .frame(height: geometry.size.height/3)
                // ============================================
                
                
                //DATE  =======================================
                Text("Thursday, 15 March 2024")
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                //=============================================
                
                
                //DIVIDER =====================================
                Divider()
                HStack {
                    Text("Nutritional Needs:")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    //                        .padding(.bottom, 10)
                    Spacer()
                    Spacer()
                }
                //=============================================
                
                
                HStack {
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    //PROGRESS-VIEW ===============================
                    VStack (alignment: .leading) {
                        HStack {
                            Text("carbs")
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                            Spacer()
                        }

                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: geometry.size.width / 2.2, height: 20)
                                .cornerRadius(16)
                            
                            Rectangle()
                                .foregroundColor(.blueGreen)
                                .frame(width: min(CGFloat(totalCarbs) * geometry.size.width / (2.2 * totalEaten), geometry.size.width / 2.2), height: 20)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("fats")
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                            Spacer()
                        }

                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: geometry.size.width / 2.2, height: 20)
                                .cornerRadius(16)
                            
                            Rectangle()
                                .foregroundColor(.blueGreen)
                                .frame(width: min(CGFloat(totalfat) * geometry.size.width / (2.2 * totalEaten), geometry.size.width / 2.2), height: 20)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("sugar")
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                            Spacer()
                        }

                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: geometry.size.width / 2.2, height: 20)
                                .cornerRadius(16)
                            
                            Rectangle()
                                .foregroundColor(.blueGreen)
                                .frame(width: min(CGFloat(totalSugar) * geometry.size.width / (2.2 * totalEaten), geometry.size.width / 2.2), height: 20)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("protein")
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                            Spacer()
                        }

                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: geometry.size.width / 2.2, height: 20)
                                .cornerRadius(16)
                            
                            Rectangle()
                                .foregroundColor(.blueGreen)
                                .frame(width: min(CGFloat(totalProtein) * geometry.size.width / (2.2 * totalEaten), geometry.size.width / 2.2), height: 20)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 10)
                    }
                    //=============================================
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    //CONSUMED-MEAL ===============================
                    VStack(alignment: .trailing) {
                        List(recipes) { item in
                            NavigationLink(destination: MacDetailRecipe(recipe: item)) {
                                Text(item.name)
                            }
                        }
                    }
                    .cornerRadius(16)
                    .shadow(radius: 1)
                    //=============================================
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/2)
                
            }
            .frame(maxWidth: geometry.size.width - geometry.size.width/73)
            .padding(.horizontal, 10)
            .padding(.vertical, 40)
        }
    }
}


#Preview {
    MacProfileView()
}
