////
////  ContentView.swift
////  NutriMate_v1
////
////  Created by MacBook Pro on 05/06/24.
////
//
//import SwiftUI
//
//struct contentView: View {
//    @State var selectedTab = 1
//        
//        var body: some View {#if os(macOS)
//                macOSHomepageView()
//    #elseif os(iOS)
//                TabView(selection: $selectedTab) {
//                    iOSHomepageView()
//                        .tabItem {
//                            VStack {
//                                Image(systemName: "house")
//                                Text("Home")
//                            }
//                        }
//                        .tag(1)
//                    
//                    ListsRecipe()
//                        .tabItem {
//                            VStack {
//                                Image(systemName: "carrot.fill")
//                                Text("Recipes")
//                            }
//                        }
//                        .tag(2)
//                }
//    #else
//                Text("Gtw")
//    #endif
//        }
//    }
//#Preview {
//    ContentView()
//}
//
//
//
