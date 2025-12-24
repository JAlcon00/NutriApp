//
//  AddPacienteView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

// AddPacienteView.swift
import SwiftUI
import SwiftData

struct AddPacienteView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var viewModel = AddPacienteViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: AppSpacing.lg) {
                    FormPacienteFields(
                        nombre: $viewModel.nombre,
                        apellido: $viewModel.apellido,
                        email: $viewModel.email,
                        telefono: $viewModel.telefono,
                        estatura: $viewModel.estaturaCm,
                        edad: $viewModel.edad,
                        tipoCuerpo: $viewModel.tipoCuerpo,
                        actividadFisica: $viewModel.actividadFisica,
                        notas: $viewModel.notas
                    )
                }
                .padding()
            }
            .navigationTitle("Nuevo Paciente")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        viewModel.crearPaciente(context: context)
                        dismiss()
                    }
                    .disabled(!viewModel.esValido)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
            }
        }
    }
}

