////
////  ContentView.swift
////  MacOS
////
////  Created by MacBook Pro on 05/06/24.
////
//
//import SwiftUI
//import SwiftData
//
//struct ContentView: View {
//    @Environment(\.modelContext) var modelContexts
//    @State var selectedTab = 1
//    @Query var recipes: [Recipes]
//    var body: some View {
//        MacHomepageView()
//        TabView(selection: $selectedTab) {
//            MacOSApp()
//                .tabItem {
//                    VStack {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
//                }
//                .tag(1)
//            
//            MacListsRecipe()
//                .tabItem {
//                    VStack {
//                        Image(systemName: "carrot.fill")
//                        Text("Recipes")
//                    }
//                }
//                .tag(2)
//            
//            Button {
//                do {
//                    try modelContexts.delete(model: Recipes.self)
//                } catch {
//                    print("Failed to delete all schools.")
//                }
//            } label: {
//                Text("Empty Model Container")
//            }.tabItem {
//                VStack {
//                    Image(systemName: "trash")
//                    Text("Empty")
//                }
//            }.tag(3)
//        }
//#else
//        Text("Gtw")
//#endif
//    }
//}
//
//#Preview {
//    ContentView()
//}
