// PatientsListViewModel.swift
// NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation
import SwiftData
import Observation

@Observable
final class PatientsListViewModel {

    var searchText: String = ""

    private let service = PacienteService()

    func obtenerUltimoPeso(de paciente: Paciente) -> Double? {
        service.calcularUltimoPeso(paciente)
    }

    func filtrarPacientes(_ pacientes: [Paciente]) -> [Paciente] {
        guard !searchText.isEmpty else { return pacientes }

        let q = searchText.lowercased()
        return pacientes.filter { paciente in
            let nombre = paciente.nombre.lowercased()
            let apellido = paciente.apellido.lowercased()
            return nombre.contains(q) || apellido.contains(q)
        }
    }

    func eliminarPaciente(context: ModelContext, paciente: Paciente) {
        context.delete(paciente)
        try? context.save()
    }
}
