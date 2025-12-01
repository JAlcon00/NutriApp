//
//  AddSesionView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI
import SwiftData

struct AddSesionView: View {

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel = AddSesionViewModel()

    let paciente: Paciente

    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Fecha", selection: $viewModel.fecha, displayedComponents: .date)

                Section("Peso") {
                    TextField("Peso en kg", text: $viewModel.pesoTexto)
                        .keyboardType(.decimalPad)
                }

                Section("Notas") {
                    TextField("Notas opcionales", text: $viewModel.notas)
                }
            }
            .navigationTitle("Nueva Sesión")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        viewModel.crearSesion(context: context, paciente: paciente)
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


