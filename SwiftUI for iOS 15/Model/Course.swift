//
//  Course.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 31/03/22.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title : String
    var subtitle : String
    var text : String
    var image : String
    var background : String
    var logo : String
}

var featuredCourses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI design for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter for Designers", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "Advanced React Hooks", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]

var courses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI design for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter for Designers", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "Advanced React Hooks", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]
