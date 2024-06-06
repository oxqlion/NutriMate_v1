//
//  User.swift
//  NutriMate_v1
//
//  Created by student on 30/05/24.
//

import Foundation
import SwiftData

@Model
class User  {
var username: String
    var target:Int
    var selectedoption:String
    
    init(username: String = "",target:Int = 0, selectedoption:String = "") {
        self.username = username
        self.target = target
        self.selectedoption = selectedoption
    }
}


