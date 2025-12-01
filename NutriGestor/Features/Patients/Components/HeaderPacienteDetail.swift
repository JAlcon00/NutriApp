//
//  HeaderPacienteDetail.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct HeaderPacienteDetail: View {
    let paciente: Paciente
    let ultimoPeso: Double?

    var body: some View {
        VStack(spacing: AppSpacing.sm) {

            PacienteAvatar(nombre: paciente.nombre, apellido: paciente.apellido)
                .frame(height: 60)

            Text("\(paciente.nombre) \(paciente.apellido)")
                .font(AppTypography.title)
                .foregroundColor(AppColors.textPrimary)

            if let peso = ultimoPeso {
                Text("Peso actual: \(peso.formatPeso()) kg")
                    .font(AppTypography.body.weight(.semibold))
                    .foregroundColor(AppColors.primaryGreen)
            }

            if let notas = paciente.notas, !notas.isEmpty {
                Text(notas)
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
        .padding(.vertical, AppSpacing.lg)
    }
}

