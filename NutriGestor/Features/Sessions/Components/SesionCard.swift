//
//  SesionCard.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct SesionCard: View {
    let sesion: Sesion
    var onProgresoTapped: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: AppSpacing.md) {

            VStack(alignment: .leading, spacing: AppSpacing.xs) {

                if let paciente = sesion.paciente {
                    Text("\(paciente.nombre) \(paciente.apellido)")
                        .font(AppTypography.body.weight(.semibold))
                        .foregroundColor(AppColors.textPrimary)
                }

                Text(sesion.fecha.toPacienteFormat())
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)

                Text("\(sesion.peso.formatPeso()) kg")
                    .font(AppTypography.header)
                    .foregroundColor(AppColors.primaryGreen)
            }

            Spacer()

            if let onProgresoTapped {
                Button {
                    onProgresoTapped()
                } label: {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundColor(AppColors.primaryGreen)
                        .padding(8)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

