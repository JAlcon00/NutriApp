// PatientsListView.swift
// NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI
import SwiftData

struct PatientsListView: View {

    @Environment(\.modelContext) private var context
    @Query(sort: \Paciente.nombre, order: .forward) private var pacientes: [Paciente]

    @State private var viewModel = PatientsListViewModel()
    @State private var showingAdd = false

    var body: some View {
        NavigationStack {
            VStack {
                let filtrados = viewModel.filtrarPacientes(pacientes)

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
                                    ultimoPeso: viewModel.obtenerUltimoPeso(de: paciente)
                                )
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    viewModel.eliminarPaciente(context: context, paciente: paciente)
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
            .sheet(isPresented: $showingAdd) {
                AddPacienteView()
            }
        }
    }
}
