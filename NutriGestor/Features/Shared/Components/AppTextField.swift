//
//  AppTextField.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct AppTextField: View {
    let title: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xs) {
            Text(title)
                .font(AppTypography.caption)
                .foregroundColor(AppColors.textSecondary)

            TextField("", text: $text)
                .keyboardType(keyboard)
                .padding()
                .background(AppColors.softBackground)
                .cornerRadius(12)
        }
    }
}
