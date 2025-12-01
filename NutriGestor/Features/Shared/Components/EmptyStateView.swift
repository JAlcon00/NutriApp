//
//  EmptyStateView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String
    let systemImage: String

    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Image(systemName: systemImage)
                .font(.system(size: 48))
                .foregroundColor(AppColors.primaryGreen.opacity(0.7))

            Text(message)
                .font(AppTypography.body)
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.lg)
        }
        .padding(.top, 100)
    }
}
