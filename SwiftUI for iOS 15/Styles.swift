//
//  Styles.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 16/02/22.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadious: CGFloat = 30.0
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadious, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .top, endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadious: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadious: cornerRadious))
    }
}
