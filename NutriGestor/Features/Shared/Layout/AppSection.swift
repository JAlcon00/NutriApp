//
//  AppSection.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct AppSection<Content: View>: View {
    let title: String
    let content: () -> Content

    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            Text(title)
                .font(AppTypography.header)
                .foregroundColor(AppColors.textPrimary)

            content()
        }
        .padding(.vertical, AppSpacing.md)
    }
}
