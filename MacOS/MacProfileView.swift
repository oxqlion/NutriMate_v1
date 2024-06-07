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

struct MacProfileView: View {
    @State private var products: [Product] = [
        .init(title: "Eaten", revenue: 0.9),
        .init(title: "Cals Left", revenue: 0.3),
    ]
    @State private var body_minerals: [Minerals] = [
        .init(name: "Carbs", amount: 0.6),
        .init(name: "Protein", amount: 0.4),
        .init(name: "Sugar", amount: 0.5),
        .init(name: "Fat", amount: 0.7),
    ]
    @State private var body_weight: [Weight] = [
        .init(name: "Monday", amount: 72.5),
        .init(name: "Tuesday", amount: 73.1),
        .init(name: "Wednesday", amount: 73.5),
        .init(name: "Thursday", amount: 73.4),
        .init(name: "Friday", amount: 72.2),
        .init(name: "Saturday", amount: 71.9),
        .init(name: "Sunday", amount: 71.5),
    ]
    
    let productColors: [String: Color] = [
        "Eaten": .blueGreen,
        "Cals Left": .slightGray,
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
                            .foregroundStyle(productColors[product.title] ?? .gray)
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
                        ForEach(body_minerals) { index in
                            HStack {
                                Text(index.name)
                                    .fontWeight(.bold)
                                    .font(.system(size: 24))
                                Spacer()
                            }
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(Color.slightGray)
                                    .frame(width: geometry.size.width/2.2, height: 20)
                                    .cornerRadius(16)
                                
                                Rectangle()
                                    .foregroundColor(.blueGreen)
                                    .frame(width: min(CGFloat(index.amount) * geometry.size.width/2.2, geometry.size.width/2.2), height: 20) // Adjust the height as needed
                                    .cornerRadius(16)
                            }
                        }
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
                        List {
                            Section(header: Text("Consumed Meal").font(.system(size: 18))) {
                                ForEach(1..<5) {index in
                                    HStack{
                                        Circle()
                                            .frame(width: 20)
                                        Text("PLACEHOLDER")
                                            .padding(.horizontal, 20)
                                            .font(.system(size: 24))
                                        Spacer()
                                    }
                                    .padding(.vertical, 10)
                                }
                            }
//                            .padding()
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
