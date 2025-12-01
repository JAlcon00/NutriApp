//
//  FormPacienteFields.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct FormPacienteFields: View {
    @Binding var nombre: String
    @Binding var apellido: String
    @Binding var email: String
    @Binding var telefono: String
    @Binding var estatura: String
    @Binding var notas: String

    var body: some View {
        Group {
            AppTextField(title: "Nombre", text: $nombre)
            AppTextField(title: "Apellido", text: $apellido)

            AppTextField(title: "Correo electrónico", text: $email, keyboard: .emailAddress)
            AppTextField(title: "Teléfono", text: $telefono, keyboard: .phonePad)

            AppTextField(title: "Estatura (cm)", text: $estatura, keyboard: .numberPad)

            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text("Notas")
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)

                TextField("Notas opcionales", text: $notas)
                    .padding()
                    .background(AppColors.softBackground)
                    .cornerRadius(12)
            }
        }
    }
}
