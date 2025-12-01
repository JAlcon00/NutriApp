//
//  UIHelpers.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct UIHelpers {
    static func cardStyle() -> some ViewModifier {
        CardModifier()
    }

    private struct CardModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}
