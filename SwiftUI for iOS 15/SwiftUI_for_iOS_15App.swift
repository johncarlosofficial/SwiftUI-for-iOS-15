//
//  SwiftUI_for_iOS_15App.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 27/01/22.
//

import SwiftUI

@main
struct SwiftUI_for_iOS_15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
