//
//  ProfileView.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import Charts
struct Product: Identifiable {
    //aa
    let id = UUID()
    let title: String
    let revenue: Double
}

struct ProfileView: View {
    let isIpad = ScreenSizeDetector().screenWidth > 650
    @State private var products: [Product] = [
        .init(title: "Eaten", revenue: 0.9),
        .init(title: "Cals Left", revenue: 0.3),
    ]
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1..<2) {index in
                        ZStack {
                            
                            
                            //CHART ======================================
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
                            //=============================================
                            
                            
                            //TEXT ========================================
                            HStack {
                                Text("1350")
                                    .font(.system(size: isIpad ? 48 : 28))
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                Text("/1800")
                                    .font(.system(size: isIpad ? 24 : 12))
                            }
                            //=============================================
                            
                            
                        }
                    }
                }
                .padding(.vertical, isIpad ? ScreenSizeDetector().screenHeight/6       : 0)
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
                .padding(.bottom, isIpad ? 20 : 20)
            //=============================================
            
            
            //PROGRESS-VIEW ===============================
            ForEach(1..<6) { index in
                HStack {
                    Text("Carbs")
                        .fontWeight(isIpad ? .bold : .medium)
                        .font(.system(size: isIpad ? 32 : 16))
                    Spacer()
                }
                ProgressView(value: 0.5)
                    .accentColor(.green)
                    .scaleEffect(x: 1, y: isIpad ? 4.5 : 2.5, anchor: .center)
                    .padding(.bottom, isIpad ? 10 : 0)
            }
            //=============================================
            
            
            //CONSUMED-MEAL ===============================
            VStack() {
                Form {
                    Section(header: Text("Consumed Meal").font(.system(size: isIpad ? 18 : 10))) {
                        ForEach(1..<5) {index in
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                Text("PLACEHOLDER")
                                    .padding(.horizontal, 20)
                                    .font(.system(size: isIpad ? 24 : 16))
                                Spacer()
                            }
                            .padding(.vertical, isIpad ? 10 : 0)
                        }
                        
                    }
                }
                .background(Color(.systemGray6))
            }.background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.top, 40)
            //=============================================
            
            
        }.frame(maxWidth: ScreenSizeDetector().screenWidth)
            .padding(.horizontal, isIpad ? 80 : 40)
            .padding(.top, 20)
    }
}


#Preview {
    ProfileView()
}