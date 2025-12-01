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
                                                viewModel.eliminarSesion(context: context, sesion: sesion)
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
        }
    }
}
