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
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center) {
                Button(action: {
                    navigateToProfile = true
                }) {
                    VStack {
                        Spacer()
                        ZStack {
                            Image(systemName: "house")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .background(Color.blueGreen)
                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                
                Button(action: {
                    navigateToDetailRecipe = true
                }) {
                    VStack {
                        Spacer()
                        ZStack {
                            Image(systemName: "leaf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .background(Color.blueGreen)
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: MacProfileView(), isActive: $navigateToProfile) {
                    EmptyView()
                }
                NavigationLink(destination: MacListsRecipe(), isActive: $navigateToDetailRecipe) {
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.blueGreen)
        }
    }
}

#Preview {
    SidebarView()
}
