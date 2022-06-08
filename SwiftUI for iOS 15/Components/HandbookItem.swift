//
//  HandbookItem.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 08/06/22.
//

import SwiftUI

struct HandbookItem: View {
    var handbook: Handbook = handbooks[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay(
                    Image(handbook.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                )
            Text(handbook.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
            Text(handbook.subtitle)
                .font(.caption.weight(.medium))
                .foregroundStyle(.secondary)
            Text(handbook.text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [handbook.color1, handbook.color2], startPoint: .topLeading, endPoint: .bottomTrailing))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}

struct HandbookItem_Previews: PreviewProvider {
    static var previews: some View {
        HandbookItem(handbook: handbooks[1])
    }
}
