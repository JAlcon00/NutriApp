//
//  PrimaryButton.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTypography.body.weight(.semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(AppColors.primaryGreen)
                .cornerRadius(12)
        }
    }
}
