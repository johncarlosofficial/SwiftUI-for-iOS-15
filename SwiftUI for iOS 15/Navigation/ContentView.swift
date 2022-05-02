//
//  ContentView.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 27/01/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack(alignment: .bottom){
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                AccountView()
            case .library:
                AccountView()
            }
                
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            
            if showModal {
                ZStack {
                    ModalView()
                        .zIndex(1)
                }
                
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0){
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(Model())
    }
}
