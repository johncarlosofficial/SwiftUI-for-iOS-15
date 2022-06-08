//
//  FeaturedItem.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 31/03/22.
//

import SwiftUI

struct FeaturedItem: View {
    var course : Course = courses[0]
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8.0){
                    Spacer()
                Image(course.logo)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26.0, height: 26.0)
                        .cornerRadius(10.0)
                        .padding(9)
                        .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .strokeStyle(cornerRadius: 16)
                Text(course.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                Text(course.subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                Text(course.text)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)

                }
                .padding(.all, 20.0)
                .padding(.vertical, 20.0)
                .frame(height: 350.0)
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        //        .cornerRadius(30.0)
        //        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle()
                .padding(.horizontal, 20)
                
    }
}


struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
