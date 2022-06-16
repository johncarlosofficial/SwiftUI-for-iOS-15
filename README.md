![cover](cover.png)

Learn how I built a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more.

## What you'll build

we'll build an iOS 15 app from scratch focusing on custom layout techniques, animations and interactions. We'll build our own custom Tab Bar, Navigation Bar and interactions. While SwiftUI hasn't changed significantly over the past 3 years, the framework is far more comprehensive, with more concise code for state management, animation and now fully supporting effects like blur material.


## Requirements

This app was built with **Xcode 13**, **iOS 15** and **MacOS Monterey**. It's important that you meet these requirements, as some newly introduced features are only available after iOS 15 and in Xcode 13.

![mac](mac.png)

## Custom Navigation Bar

When you have a custom tab bar, it makes sense to pair it with a custom navigation bar. While it is recommended to use the built-in Navigation View and Tab View for best adaptability across platforms and accessibility, learning how to build and style your own will take your skills to the next level. Popular apps like Instagram, TikTok, Clubhouse actually build their very own bars. For designers, this is fantastic for prototyping since you will have less contraints and are not forced to use the stock user interface for everything.

## Custom Modifiers

When you repeat the same modifiers or collection of styles over and over, it is a good idea to start your custom modifiers. A huge advantage with this technique is that you can isolate the styles, just like a component, and apply conditions based on resolutions and devices. Also, when you apply changes, it'll apply everywhere at once.
