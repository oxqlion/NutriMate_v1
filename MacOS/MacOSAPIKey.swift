//
//  APIKey.swift
//  NutriMate_v1
//
//  Created by zenzen on 05/06/24.
//

import Foundation

enum MacOSAPIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "MacOSGenerativ-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'GenerateiveAI-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'MacOSGenerativ-Info.plist'.")
        }
        if value.starts(with: "_") {
            fatalError(
                "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
            )
        }
        return value
    }
}
