//
//  NutriMate_v1App.swift
//  NutriMate_v1
//
//  Created by zenzen on 28/05/24.
//

import SwiftUI

@main
struct NutriMate_v1App: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }.modelContainer(for: [Recipers.self,DailyStats.self])
    }
}
