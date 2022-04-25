//
//  Suggestion.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 25/04/22.
//

import SwiftUI

struct Suggestion: Identifiable{
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]
