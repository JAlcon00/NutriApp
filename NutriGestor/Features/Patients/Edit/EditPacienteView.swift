//
//  EditPacienteView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI
import SwiftData

struct EditPacienteView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var viewModel: EditPacienteViewModel

    init(paciente: Paciente) {
        _viewModel = State(initialValue: EditPacienteViewModel(paciente: paciente))
    }

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
                        notas: $viewModel.notas
                    )
                }
                .padding()
            }
            .navigationTitle("Editar Paciente")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        viewModel.actualizarPaciente(context: context)
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

