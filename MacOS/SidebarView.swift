//
//  SidebarView.swift
//  MacOS
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct SidebarView: View {
    @State private var navigateToProfile = false
    @State private var navigateToDetailRecipe = false
    @State private var navigateToDelete = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Button(action: {
                    navigateToProfile = true
                }) {
                    VStack {
                        ZStack {
                            Image(systemName: "house")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                
                Button(action: {
                    navigateToDetailRecipe = true
                }) {
                    VStack {
                        ZStack {
                            Image(systemName: "leaf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                
                Button(action: {
                    navigateToDelete     = true
                }) {
                    VStack {
                        ZStack {
                            Image(systemName: "person")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: MacHomepageView(), isActive: $navigateToProfile) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(
                    destination: MacListsRecipe(),
                    isActive: $navigateToDetailRecipe
                ) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(destination: DietPlanBenefitsView(), isActive: $navigateToDelete) {
                    EmptyView()
                }
                .hidden()

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.blueGreen)
        }
    }
}
struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}

