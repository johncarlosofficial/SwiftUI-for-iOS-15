//
//  Tab.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 30/03/22.
//

import SwiftUI

struct TabItem: Identifiable{
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house", tab: .home),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore),
    TabItem(text: "Notifications", icon: "bell", tab: .notifications),
    TabItem(text: "Library", icon: "rectangle.stack", tab: .library),
]

enum Tab: String{
    case home
    case explore
    case notifications
    case library
}
