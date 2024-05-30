//
//  DetailRecipeView.swift
//  NutriMate_v1
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct DetailRecipeView: View {
    var body: some View {
        
        VStack {
            Text("Roasted Lamb Rump with Sweet Peas and Mint Salsa")
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            Image("Lamb")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360)
                .padding()
                .padding()
        }
        
        HStack(spacing: 10) {
            VStack {
                Text("Serves")
                    .font(.headline)
                Spacer()
                    .frame(height: 16)
                
                Text("4")
                    .font(.subheadline)
            }
            .padding(.bottom, 310)
            
                Rectangle()
                    .frame(width: 1, height: 50)
                    .foregroundColor(.black)
                    .padding(.bottom, 310)
            
            VStack {
                Text("Prep Time")
                    .font(.headline)
                Spacer()
                    .frame(height: 16)
                
                Text("20 Mins")
                    .font(.subheadline)
            }
            .padding(.bottom, 310)
            
            Rectangle()
                .frame(width: 1, height: 50)
                .foregroundColor(.black)
                .padding(.bottom, 310)
        
            VStack {
                Text("Cook Time")
                    .font(.headline)
                Spacer()
                    .frame(height: 16)
                
                Text("45 Mins")
                    .font(.subheadline)
            }
            .padding(.bottom, 310)
            
                Rectangle()
                    .frame(width: 1, height: 50)
                    .foregroundColor(.black)
                    .padding(.bottom, 310)
            
            VStack {
                Text("Calories")
                    .font(.headline)
                Spacer()
                    .frame(height: 16)
                
                Text("570 kkal")
                    .font(.subheadline)
            }
            .padding(.bottom, 310)
        }
        
        
        ZStack {
                   RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: 0xeeeeee))
                   
                   VStack {
                       Text("Ingeredients")
                           .font(.headline)
                           .foregroundColor(.black)
                           .padding()
                   }
               }
               .frame(width: 300, height: 200)
    }
}

extension Color {
    init(hex: UInt32, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}


#Preview {
    DetailRecipeView()
}
