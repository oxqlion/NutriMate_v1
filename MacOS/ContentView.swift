//
//  ContentView.swift
//  MacOS
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContexts
    @State var selectedTab = 1
    @Query var recipes: [Recipes]
    var body: some View {
        SidebarView()
    }
}

#Preview {
    ContentView()
}
