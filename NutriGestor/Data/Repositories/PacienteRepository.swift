//
//  PacienteRepository.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation
import SwiftData

@MainActor
final class PacienteRepository {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func crear(_ paciente: Paciente) {
        context.insert(paciente)
        try? context.save()
    }

    func obtenerTodos() -> [Paciente] {
        let descriptor = FetchDescriptor<Paciente>(
            sortBy: [SortDescriptor(\.nombre, order: .forward)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func obtenerPorID(_ id: UUID) -> Paciente? {
        let descriptor = FetchDescriptor<Paciente>(
            predicate: #Predicate { $0.id == id }
        )
        return try? context.fetch(descriptor).first
    }

    func actualizar() {
        try? context.save()
    }

    func eliminar(_ paciente: Paciente) {
        context.delete(paciente)
        try? context.save()
    }
}
