//
//  MacOSApp.swift
//  MacOS
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI

@main
struct MacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [Recipes.self, DailyStats.self])
    }
}
