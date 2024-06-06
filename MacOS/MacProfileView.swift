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
        .init(name: "Calcium", amount: 0.8),
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
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
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
                        }.frame(width: geometry.size.height/3.2, height: geometry.size.height/3.2)
                            .padding(.horizontal, 30)
                        VStack {
                            HStack {
                                Text("1350")
                                    .font(.system(size: 48))
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                Text("/1800")
                                    .font(.system(size: 24))
                            }
                            .padding(.bottom, 15)
                        }
                    }
                    .padding(.horizontal, 60)
                    //=============================================
                    
                    
                    //BAR-CHART =================================
                    ZStack {
                        Chart(body_minerals) { items in
                            BarMark(
                                x: .value(Text(verbatim: "Name"), items.name),
                                y: .value(Text(verbatim: "Amount"), items.amount)
                            )
                            .foregroundStyle(by: .value(Text(verbatim: items.name), items.amount))
                        }
                        .frame(width: geometry.size.height/3.2, height: geometry.size.height/3.2)
                        .padding(.horizontal, 30)
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
//                    Spacer()
                    HStack {
                        //PROGRESS-VIEW ===============================
                        VStack {
                            ForEach(body_minerals) { index in
                                HStack {
                                    Text(index.name)
                                        .fontWeight(.bold)
                                        .font(.system(size: 24))
                                    Spacer()
                                }
                                ProgressView(value: index.amount)
                                    .accentColor(.green)
                                    .scaleEffect(x: 1, y: 100000000, anchor: .center)
                                    .padding(.bottom, 10)
                            }
                        }
//                        .padding(.horizontal, 40)
                        //=============================================
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        //CONSUMED-MEAL ===============================
                        VStack() {
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
                            }
                            .background(Color(.systemGray))
                        }.background(Color(.systemGray))
                            .cornerRadius(16)
    //                        .padding(.top, 40)
//                            .padding(.horizontal, 40)
                        //=============================================
                    }
//                    Spacer()
                }
                .frame(width: geometry.size.width - geometry.size.width/10, height: geometry.size.height/2)
                
                
            }.frame(maxWidth: geometry.size.width)
                .padding(.horizontal, 80)
                .padding(.vertical, 40)
        }
    }
}


#Preview {
    MacProfileView()
}
