//
//  SesionService.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct SesionService {

    func crearSesion(fecha: Date, peso: Double, notas: String?, paciente: Paciente) -> Sesion {
        Sesion(
            fecha: fecha,
            peso: peso,
            notas: notas?.trimmed,
            paciente: paciente
        )
    }

    func sesionesOrdenadas(_ sesiones: [Sesion]) -> [Sesion] {
        sesiones.sorted { $0.fecha > $1.fecha }
    }
}

