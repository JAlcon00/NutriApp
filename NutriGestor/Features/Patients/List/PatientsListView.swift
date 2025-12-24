// PatientsListView.swift
// NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI
import SwiftData

struct PatientsListView: View {

    @Query(sort: \Paciente.nombre, order: .forward) private var pacientes: [Paciente]

    @State private var showingAdd = false
    @State private var viewModel = PatientsListViewModel()
    @State private var pacienteAEliminar: Paciente? = nil

    var body: some View {
        @Bindable var vm = viewModel
        let filtrados = viewModel.filtrarPacientes(pacientes)

        NavigationStack {
            VStack {
                if filtrados.isEmpty {
                    EmptyStateView(
                        message: viewModel.searchText.isEmpty ?
                            "No hay pacientes registrados aún." :
                            "No se encontraron coincidencias.",
                        systemImage: "person.3"
                    )
                } else {
                    List {
                        ForEach(filtrados) { paciente in
                            NavigationLink {
                                PacienteDetailView(paciente: paciente)
                            } label: {
                                PacienteCard(
                                    paciente: paciente,
                                    ultimoPeso: PatientsListViewModel().obtenerUltimoPeso(de: paciente)
                                )
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    pacienteAEliminar = paciente
                                } label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pacientes")
            .searchable(text: $viewModel.searchText, prompt: "Buscar paciente")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .confirmationDialog("¿Eliminar paciente?", item: $pacienteAEliminar, titleVisibility: .visible) { paciente in
                Button("Eliminar", role: .destructive) {
                    viewModel.eliminarPaciente(context: context, paciente: paciente)
                }
                Button("Cancelar", role: .cancel) {}
            } message: { paciente in
                Text("Se eliminará \(paciente.nombre) \(paciente.apellido) y todas sus sesiones.")
            }
            .sheet(isPresented: $showingAdd) {
                AddPacienteView()
            }
        }
    }
}
