//
//  PacienteCard.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct PacienteCard: View {
    let paciente: Paciente
    let ultimoPeso: Double?

    var body: some View {
        HStack(spacing: AppSpacing.md) {

            PacienteAvatar(nombre: paciente.nombre, apellido: paciente.apellido)

            VStack(alignment: .leading, spacing: AppSpacing.xs) {

                Text("\(paciente.nombre) \(paciente.apellido)")
                    .font(AppTypography.body.weight(.semibold))
                    .foregroundColor(AppColors.textPrimary)

                if let peso = ultimoPeso {
                    Text("\(peso.formatPeso()) kg")
                        .font(AppTypography.caption)
                        .foregroundColor(AppColors.primaryGreen)
                } else {
                    Text("Sin registros")
                        .font(AppTypography.caption)
                        .foregroundColor(AppColors.textSecondary)
                }

                Text("Estatura: \(Int(paciente.estaturaCm)) cm")
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)
            }

            Spacer()
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
