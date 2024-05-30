//
//  ContentView.swift
//  NutriMate_v1
//
//  Created by zenzen on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
#if os(macOS)
            macOSHomepageView()
#elseif os(iOS)
            iOSHomepageView()
#else
            Text("Gtw")
#endif
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
