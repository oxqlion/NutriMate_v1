//
//  ProfileView.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import Charts
import SwiftData
struct Product: Identifiable {
    //aa
    let id = UUID()
    let title: String
    let revenue: Double
}

struct Minerals: Identifiable {
    //aa
    let id = UUID()
    let name: String
    let amount: Double
}

struct Weight: Identifiable {
    //aa
    let id = UUID()
    let name: String
    let amount: Double
}

struct ProfileView: View {
    @State private var showGraph: Int = 1
    @Environment(\.modelContext) var modelContexts
    @StateObject var calorieManager = CalorieManager()
    @Query var dailystats: [DailyStats]
    @Query var recipes: [Recipes]
    let isIpad = ScreenSizeDetector().screenWidth > 650
//    @State private var body_weight: [Weight] = [
//        .init(name: "Monday", amount: 72.5),
//        .init(name: "Tuesday", amount: 73.1),
//        .init(name: "Wednesday", amount: 73.5),
//        .init(name: "Thursday", amount: 73.4),
//        .init(name: "Friday", amount: 72.2),
//        .init(name: "Saturday", amount: 71.9),
//        .init(name: "Sunday", amount: 71.5),
//    ]
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
//    @State private var products: [Product] = [
//        .init(title: "Eaten", revenue: Double(totalCarbs)),
//        .init(title: "Cals Left", revenue: 0.3),
//    ]
    var products: [Product] {
      [
        .init(title: "Eaten", revenue: totalCarbs),
        .init(title: "Cals Left", revenue: calorieManager.allowedCalories-totalCarbs),
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
        NavigationView {
            VStack{
                ScrollView(.horizontal) {
//                    LazyHStack {
//                        Text("\(totalCarbs)")
//                        Text("\(totalProtein)")
//                        Text("\(totalSugar)")
//                        Text("\(totalfat)")
//                        Text("\(totalEaten)")
//                        
//                        //DONUT-CHART =================================
//                        //                ScrollView(.horizontal) {
//                        //                    LazyHStack {
//                        //                        //                    Text("\(totalCarbs)")
//                        //                        //                    Text("\(totalProtein)")
//                        //                        //                    Text("\(totalSugar)")
//                        //                        //                    Text("\(totalfat)")
//                        //                        //                    Text("\(totalEaten)")
//                        //
//                        //                        //DONUT-CHART =================================
//                        //                        ZStack {
//                        //                            Chart(products) { product in
//                        //                                SectorMark(
//                        //                                    angle: .value(
//                        //                                        Text(verbatim: product.title),
//                        //                                        product.revenue
//                        //                                    ),
//                        //                                    innerRadius: .ratio(isIpad ? 0.75 : 0.8)
//                        //                                )
//                        //                                .foregroundStyle(
//                        //                                    by: .value(
//                        //                                        Text(verbatim: product.title),
//                        //                                        product.title
//                        //                                    )
//                        //                                )
//                        //                            }.frame(width: isIpad ? ScreenSizeDetector().screenWidth/2.3: ScreenSizeDetector().screenWidth/2, height: isIpad ? ScreenSizeDetector().screenHeight/2.3 : ScreenSizeDetector().screenHeight/2)
//                        //                                .padding(.horizontal, isIpad ? ScreenSizeDetector().screenWidth/5.1: ScreenSizeDetector().screenWidth/6.5)
//                        //
//                        //
//                        //
//                        //                            //TEXT ========================================
//                        //                            VStack {
//                        //                                HStack {
//                        //                                    Text("1350")
//                        //                                        .font(.system(size: isIpad ? 48 : 28))
//                        //                                        .fontWeight(.bold)
//                        //                                        .foregroundColor(.green)
//                        //                                    Text("/1800")
//                        //                                        .font(.system(size: isIpad ? 24 : 12))
//                        //                                }
//                        //                                .padding(.bottom, 15)
//                        //                            }
//                        //                            //=============================================
//                        //                        }
//                        //                        //=============================================
//                        //
//                        //
//                        //                        //BAR-CHART =================================
//                        //                        ZStack {
//                        //                            Chart(body_minerals) { items in
//                        //                                BarMark(
//                        //                                    x: .value(Text(verbatim: "Name"), items.name),
//                        //                                    y: .value(Text(verbatim: "Amount"), items.amount)
//                        //                                )
//                        //                                .foregroundStyle(by: .value(Text(verbatim: items.name), items.amount))
//                        //                            }
//                        //                            .frame(width: isIpad ? ScreenSizeDetector().screenWidth/2.3 : ScreenSizeDetector().screenWidth/2,
//                        //                                   height: isIpad ? ScreenSizeDetector().screenHeight/4 : ScreenSizeDetector().screenHeight/5)
//                        //                            .padding(.horizontal, isIpad ? ScreenSizeDetector().screenWidth/5.1 : ScreenSizeDetector().screenWidth/6.5)
//                        //                            //=============================================
//                        //
//                        //
//                        //                        }
//                        //
//                        //                        ZStack {
//                        //                            // LINE-CHART =================================
//                        //                            Chart {
//                        //                                ForEach(body_weight) { weight in
//                        //                                    LineMark(
//                        //                                        x: .value("Product", weight.name),
//                        //                                        y: .value("Revenue", weight.amount)
//                        //                                    )
//                        //                                }
//                        //                                .interpolationMethod(.catmullRom) // Optional: adds smooth curves
//                        //                            }
//                        //                            .frame(width: isIpad ? ScreenSizeDetector().screenWidth/2.3 : ScreenSizeDetector().screenWidth/2,
//                        //                                   height: isIpad ? ScreenSizeDetector().screenHeight/4 : ScreenSizeDetector().screenHeight/5)
//                        //                            .padding(.horizontal, isIpad ? ScreenSizeDetector().screenWidth/5.1 : ScreenSizeDetector().screenWidth/6.5)
//                        //                            // =============================================
//                        //                        }
//                        //                    }
//                        //                    .frame(height: ScreenSizeDetector().screenHeight/4)
//                        //                }
//                    }
                        
                        HStack {
                            if showGraph == 1 {
                                ZStack {
                                    Chart(products) { product in
                                        SectorMark(
                                            angle: .value(
                                                Text(verbatim: product.title),
                                                product.revenue
                                            ),
                                            innerRadius: .ratio(isIpad ? 0.75 : 0.8)
                                        )
                                        .foregroundStyle(
                                            by: .value(
                                                Text(verbatim: product.title),
                                                product.title
                                            )
                                        )
                                    }.frame(width: isIpad ? ScreenSizeDetector().screenWidth/2.3: ScreenSizeDetector().screenWidth/2, height: isIpad ? ScreenSizeDetector().screenHeight/2.3 : ScreenSizeDetector().screenHeight/2)
                                        .padding(.horizontal, isIpad ? ScreenSizeDetector().screenWidth/5.1: ScreenSizeDetector().screenWidth/6.5)
                                    VStack {
                                        HStack {
                                            Text("\(Int(totalEaten))")
                                                .font(.system(size: isIpad ? 48 : 28))
                                                .fontWeight(.bold)
                                                .foregroundColor(.green)
                                            Text("/\(calorieManager.allowedCalories)")
                                                .font(.system(size: isIpad ? 24 : 12))
                                        }
                                        .padding(.bottom, 15)
                                    }
                                }
                            } else {
                                ZStack {
                                    // LINE-CHART =================================
                                    Chart {
                                        ForEach(body_weight) { weight in
                                            LineMark(
                                                x: .value("Product", weight.name),
                                                y: .value("Revenue", weight.amount)
                                            )
                                        }
                                        .interpolationMethod(.catmullRom) // Optional: adds smooth curves
                                    }
                                    .frame(width: isIpad ? ScreenSizeDetector().screenWidth/2.3 : ScreenSizeDetector().screenWidth/2,
                                           height: isIpad ? ScreenSizeDetector().screenHeight/4 : ScreenSizeDetector().screenHeight/5)
                                    .padding(.horizontal, isIpad ? ScreenSizeDetector().screenWidth/5.1 : ScreenSizeDetector().screenWidth/6.5)
                                }
                            }
                        }
                        .frame(height: ScreenSizeDetector().screenHeight/4)
                        
                        HStack {
                            Button {
                                showGraph = 1
                            } label: {
                                Text("Today")
                            }
                            
                            Button {
                                showGraph = 2
                            } label: {
                                Text("Details")
                            }
                        }
                        
                        //DATE  =======================================
                        Text("Thursday, 15 March 2024")
                            .fontWeight(isIpad ? .bold : .medium)
                            .font(.system(size: isIpad ? 28 : 20))
                        //=============================================
                        
                        
                        //DIVIDER =====================================
                        Divider()
                        Text("Nutritional Needs:")
                            .font(.system(size: isIpad ? 18 : 10))
                            .foregroundColor(.gray)
                            .padding(.bottom, isIpad ? 15 : 10)
                        //=============================================
                        
                        
                        //PROGRESS-VIEW ===============================
                            HStack {
                                Text("carbs")
                                    .fontWeight(isIpad ? .bold : .medium)
                                    .font(.system(size: isIpad ? 32 : 16))
                                Spacer()
                            }
                    ProgressView(value: totalCarbs/totalEaten)
                                .accentColor(.green)
                                .scaleEffect(x: 1, y: isIpad ? 4 : 2.5, anchor: .center)
                                .padding(.bottom, isIpad ? 10 : 0)
                    
                    HStack {
                        Text("fats")
                            .fontWeight(isIpad ? .bold : .medium)
                            .font(.system(size: isIpad ? 32 : 16))
                        Spacer()
                    }
            ProgressView(value: totalfat/totalEaten)
                        .accentColor(.green)
                        .scaleEffect(x: 1, y: isIpad ? 4 : 2.5, anchor: .center)
                        .padding(.bottom, isIpad ? 10 : 0)
                    
                    HStack {
                        Text("sugar")
                            .fontWeight(isIpad ? .bold : .medium)
                            .font(.system(size: isIpad ? 32 : 16))
                        Spacer()
                    }
            ProgressView(value: totalSugar/totalEaten)
                        .accentColor(.green)
                        .scaleEffect(x: 1, y: isIpad ? 4 : 2.5, anchor: .center)
                        .padding(.bottom, isIpad ? 10 : 0)
                    HStack {
                        Text("protein")
                            .fontWeight(isIpad ? .bold : .medium)
                            .font(.system(size: isIpad ? 32 : 16))
                        Spacer()
                    }
            ProgressView(value: totalProtein/totalEaten)
                        .accentColor(.green)
                        .scaleEffect(x: 1, y: isIpad ? 4 : 2.5, anchor: .center)
                        .padding(.bottom, isIpad ? 10 : 0)
                    
                        //=============================================
                        
                        
                        //CONSUMED-MEAL ===============================
                        VStack() {
                            //                Form {
                            //                    Section(header: Text("Consumed Meal").font(.system(size: isIpad ? 18 : 10))) {
                            //                        ForEach(1..<5) {index in
                            //                            HStack{
                            //                                Circle()
                            //                                    .frame(width: 20)
                            //                                Text("PLACEHOLDER")
                            //                                    .padding(.horizontal, 20)
                            //                                    .font(.system(size: isIpad ? 24 : 16))
                            //                                Spacer()
                            //                            }
                            //                            .padding(.vertical, isIpad ? 10 : 0)
                            //                        }
                            //                    }
                            //                }
                            //                .background(Color(.systemGray6))
                            
                            List(recipes) { item in
                                NavigationLink(destination: DetailRecipe(recipe: item)) {
                                    Text(item.name)
                                }
                            }
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(16)
                        .padding(.top, 30)
                        
                        //=============================================
                        
                        
                    }.frame(maxWidth: ScreenSizeDetector().screenWidth)
                        .padding(.horizontal, isIpad ? 80 : 40)
                        .padding(.top, 20)
                }
            }
        }
    }
    

//#Preview {
//    ProfileView()
//}
struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().modelContainer(for: [Recipes.self, DailyStats.self])
    }
}
