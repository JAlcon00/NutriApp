//
//  PacienteService.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct PacienteService {

    func normalizarNombre(_ nombre: String) -> String {
        nombre.trimmed.capitalizedFirst
    }

    func normalizarApellido(_ apellido: String) -> String {
        apellido.trimmed.capitalizedFirst
    }

    func calcularUltimoPeso(_ paciente: Paciente) -> Double? {
        paciente.sesiones.sorted { $0.fecha > $1.fecha }.first?.peso
    }

    func ordenarSesiones(_ sesiones: [Sesion]) -> [Sesion] {
        sesiones.sorted { $0.fecha > $1.fecha }
    }
}
