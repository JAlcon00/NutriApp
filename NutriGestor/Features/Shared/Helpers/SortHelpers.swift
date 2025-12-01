//
//  SortHelpers.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct SortHelpers {
    static func ordenarSesionesPorFecha(_ sesiones: [Sesion]) -> [Sesion] {
        sesiones.sorted { $0.fecha > $1.fecha }
    }

    static func ordenarPacientesPorNombre(_ pacientes: [Paciente]) -> [Paciente] {
        pacientes.sorted { $0.nombre.localizedCaseInsensitiveCompare($1.nombre) == .orderedAscending }
    }
}
