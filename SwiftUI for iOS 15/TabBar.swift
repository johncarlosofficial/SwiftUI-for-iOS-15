//
//  TabBar.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 30/03/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        //Default TabView
//        TabView {
//            ContentView()
//                .tabItem{
//                    Image(systemName: "house")
//                    Text("Learn now")
//                }
//            AccountView()
//                .tabItem{
//                    Image(systemName: "magnifyingglass")
//                    Text("Explore")
//                }
//        }
        ZStack(alignment: .bottom){
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack{
                ForEach(tabItems){ item in
                    VStack(spacing: 0){
                        Image(systemName: item.icon)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 80, height: 29)
                        Text(item.text)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .strokeStyle()
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
