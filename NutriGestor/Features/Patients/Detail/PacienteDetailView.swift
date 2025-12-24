//
//  PacienteDetailView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI
import SwiftData

struct PacienteDetailView: View {

    @Environment(\.modelContext) private var context
    @State private var viewModel: PacienteDetailViewModel

    @State private var showingEditar = false
    @State private var showingNuevaSesion = false
    @State private var showingProgreso = false
    @State private var sesionAEliminar: Sesion? = nil

    init(paciente: Paciente) {
        _viewModel = State(initialValue: PacienteDetailViewModel(paciente: paciente))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: AppSpacing.lg) {

                    HeaderPacienteDetail(
                        paciente: viewModel.paciente,
                        ultimoPeso: viewModel.ultimoPeso
                    )

                    AppSection("Sesiones") {
                        if viewModel.sesionesOrdenadas.isEmpty {
                            EmptyStateView(
                                message: "Este paciente aún no tiene sesiones registradas.",
                                systemImage: "chart.line.uptrend.xyaxis"
                            )
                        } else {
                            VStack(spacing: AppSpacing.md) {
                                ForEach(viewModel.sesionesOrdenadas) { sesion in
                                    SesionCard(sesion: sesion)
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                sesionAEliminar = sesion
                                            } label: {
                                                Label("Eliminar", systemImage: "trash")
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Detalles")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Editar paciente") { showingEditar = true }
                        Button("Ver progreso") { showingProgreso = true }
                        Button("Nueva sesión") { showingNuevaSesion = true }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .sheet(isPresented: $showingEditar) {
                EditPacienteView(paciente: viewModel.paciente)
            }
            .sheet(isPresented: $showingNuevaSesion) {
                AddSesionView(paciente: viewModel.paciente)
            }
            .sheet(isPresented: $showingProgreso) {
                ProgresoPacienteView(
                    paciente: viewModel.paciente,
                    sesiones: viewModel.sesionesOrdenadas
                )
            }
            .confirmationDialog("¿Eliminar sesión?", item: $sesionAEliminar, titleVisibility: .visible) { sesion in
                Button("Eliminar", role: .destructive) {
                    viewModel.eliminarSesion(context: context, sesion: sesion)
                }
                Button("Cancelar", role: .cancel) {}
            } message: { sesion in
                Text("Se eliminará la sesión del \(sesion.fecha.toPacienteFormat()).")
            }
        }
    }
}
