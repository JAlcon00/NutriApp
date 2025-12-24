//
//  AppTextField.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI
import UIKit

struct AppTextField: View {
    let title: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default
    var contentType: UITextContentType? = nil
    var submitLabel: SubmitLabel = .return

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xs) {
            Text(title)
                .font(AppTypography.caption)
                .foregroundColor(AppColors.textSecondary)

            TextField("", text: $text)
                .keyboardType(keyboard)
                .textContentType(contentType)
                .submitLabel(submitLabel)
                .padding()
                .background(AppColors.softBackground)
                .cornerRadius(12)
        }
    }
}
