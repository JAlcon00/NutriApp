// SessionsListView.swift
import SwiftUI
import SwiftData

struct SessionsListView: View {

    @Environment(\.modelContext) private var context
    @State private var viewModel = SessionsListViewModel()
    @Query(sort: \Sesion.fecha, order: .reverse) private var sesiones: [Sesion]

    @State private var pacienteParaProgreso: Paciente? = nil

    var body: some View {
        @Bindable var vm = viewModel

        NavigationStack {
            ScrollView {
                let filtradas = vm.filtrarSesiones(sesiones)

                VStack(spacing: 16) {
                    ForEach(filtradas) { sesion in
                        SesionCard(sesion: sesion) {
                            if let paciente = sesion.paciente {
                                pacienteParaProgreso = paciente
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Sesiones")
            .searchable(text: $vm.searchText, prompt: "Buscar por paciente")
            .sheet(item: $pacienteParaProgreso) { paciente in

                ProgresoPacienteView(
                    paciente: paciente,
                    sesiones: sesiones.filter { $0.paciente.id == paciente.id }
                )
            }
        }
    }
}
#Preview {
    SessionsListView()
}
