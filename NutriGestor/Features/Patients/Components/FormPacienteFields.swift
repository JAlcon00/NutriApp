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
    @Binding var edad: String
    @Binding var tipoCuerpo: TipoCuerpo?
    @Binding var actividadFisica: ActividadFisica?
    @Binding var notas: String

    var body: some View {
        Group {
            AppTextField(title: "Nombre", text: $nombre, keyboard: .default, contentType: .givenName, submitLabel: .next)
            AppTextField(title: "Apellido", text: $apellido, keyboard: .default, contentType: .familyName, submitLabel: .next)

            AppTextField(title: "Correo electrónico", text: $email, keyboard: .emailAddress, contentType: .emailAddress, submitLabel: .next)
            AppTextField(title: "Teléfono", text: $telefono, keyboard: .phonePad, contentType: .telephoneNumber, submitLabel: .next)

            AppTextField(title: "Estatura (cm)", text: $estatura, keyboard: .numberPad, contentType: .none, submitLabel: .next)
            AppTextField(title: "Edad (años)", text: $edad, keyboard: .numberPad, contentType: .none, submitLabel: .next)

            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text("Tipo de cuerpo")
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)

                Picker("Tipo de cuerpo", selection: $tipoCuerpo) {
                    Text("Sin especificar").tag(Optional<TipoCuerpo>.none)
                    ForEach(TipoCuerpo.allCases, id: \.self) { tipo in
                        Text(tipo.displayName).tag(Optional(tipo))
                    }
                }
                .pickerStyle(.menu)
            }

            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text("Actividad física")
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)

                Picker("Actividad física", selection: $actividadFisica) {
                    Text("Sin especificar").tag(Optional<ActividadFisica>.none)
                    ForEach(ActividadFisica.allCases, id: \.self) { act in
                        Text(act.displayName).tag(Optional(act))
                    }
                }
                .pickerStyle(.menu)
            }

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

