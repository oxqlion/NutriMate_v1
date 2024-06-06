//
//  SidebarView.swift
//  MacOS
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        NavigationView {
//            GeometryReader {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    NavigationLink(destination: MacProfileView(), label: {
                        ZStack {
                            Image(systemName: "house")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .buttonStyle(PlainButtonStyle())
                    
                    Divider()
                    
                NavigationLink(destination: MacListsRecipe(), label: {
                        ZStack {
                            Image(systemName: "leaf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.white )
//            }
        }
        
        
    }
}

#Preview {
    SidebarView()
}
