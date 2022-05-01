//
//  InputStyle.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 01/05/22.
//

import SwiftUI

struct InputStyle: ViewModifier {
    var icon: String

    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 40)
            .background(.thinMaterial)
            .mask(RoundedRectangle(cornerRadius: 20))
            .strokeStyle(cornerRadious: 20)
            .overlay(
                Image(systemName: icon)
                    .frame(width: 36, height: 36)
                    .background(.thinMaterial)
                    .cornerRadius(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
            )
    }
}

extension View {
    func inputStyle(icon: String = "mail") -> some View {
        modifier(InputStyle(icon: icon))
    }
}
