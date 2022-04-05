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
    
    var contentDescription: String
    var contentTitle : String
    var contentText1 : String
    var contentText2 : String
    var avatar : String
    var avatarDescription : String
}

var featuredCourses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 5", background: "Background 5", logo: "Logo 2", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
    Course(title: "UI design for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 3", background: "Background 4", logo: "Logo 4", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
    Course(title: "Flutter for Designers", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 1", background: "Background 1", logo: "Logo 1", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
    Course(title: "Advanced React Hooks", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 2", background: "Background 2", logo: "Logo 3", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
]

var courses = [
    Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 5", background: "Background 5", logo: "Logo 2", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
    Course(title: "UI design for iOS 15", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 3", background: "Background 4", logo: "Logo 4", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
    Course(title: "Flutter for Designers", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 1", background: "Background 1", logo: "Logo 1", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
    Course(title: "Advanced React Hooks", subtitle: "20 sections - 3 hours", text: "Learn how I buit an iOS App for iOS 15 with custum layouts, animations and...", image: "Illustration 2", background: "Background 2", logo: "Logo 3", contentDescription: "SwiftUI is handson the best way for designers to take a first step into code", contentTitle: "The SwuifUI course", contentText1: "This course is unlike any other. We care about design and want to make sure you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS.", contentText2: "While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.", avatar: "Avatar Default", avatarDescription: "Taught by John Carlos"),
]
