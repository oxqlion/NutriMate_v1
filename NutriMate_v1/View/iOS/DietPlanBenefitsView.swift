//
//  DietPlanBenefitsView.swift
//  NutriMate_v1
//
//  Created by zenzen on 07/06/24.
//

import SwiftUI

struct DietPlanBenefitsView: View {
    @Environment(\.modelContext) var modelContexts
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Are you sure you want to delete your diet plan?")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("Our app benefits you in many ways, such as:")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("1. Personalized meal plans tailored to your dietary needs and goals.")
                Text("2. Easy tracking of your calorie intake and nutritional information.")
                Text("3. Access to a database of healthy recipes and meal ideas.")
                Text("4. Reminders and notifications to keep you on track with your eating habits.")
                Text("5. Progress tracking to monitor your journey towards better health.")
            }
            .font(.body)
            .foregroundColor(.secondary)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: deleteDietPlan) {
                Text("Delete Diet Plan")
                    .fontWeight(.semibold)
                    .frame(maxWidth: 100)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
    
    func deleteDietPlan() {
        do {
            try modelContexts.delete(model: Recipes.self)
        } catch {
            print("Failed to delete diet plan.")
        }
    }
}

    
    #Preview {
        DietPlanBenefitsView()
    }
