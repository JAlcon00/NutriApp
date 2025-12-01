// SesionRepository.swift
import Foundation
import SwiftData

@MainActor
final class SesionRepository {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func crear(_ sesion: Sesion) {
        context.insert(sesion)
        try? context.save()
    }

    func obtenerPorPaciente(_ paciente: Paciente) -> [Sesion] {
        let descriptor = FetchDescriptor<Sesion>(
            sortBy: [SortDescriptor(\.fecha, order: .reverse)]
        )

        let todas = (try? context.fetch(descriptor)) ?? []

        return todas.filter { $0.paciente?.id == paciente.id }
    }

    func actualizar() {
        try? context.save()
    }

    func eliminar(_ sesion: Sesion) {
        context.delete(sesion)
        try? context.save()
    }
}
