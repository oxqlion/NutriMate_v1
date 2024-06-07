//
//  Helper.swift
//  NutriMate_v1
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI

struct Product: Identifiable {
    //aa
    let id = UUID()
    let title: String
    let revenue: Double
}

struct Minerals: Identifiable {
    //aa
    let id = UUID()
    let name: String
    let amount: Double
}

struct Weight: Identifiable {
    //aa
    let id = UUID()
    let name: String
    let amount: Double
}
