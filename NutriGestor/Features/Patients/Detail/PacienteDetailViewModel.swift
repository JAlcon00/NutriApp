//
//  PacienteDetailViewModel.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation
import SwiftData
import Observation

@Observable
final class PacienteDetailViewModel {

    var paciente: Paciente

    private let metrics = MetricsService()
    private let sesionService = SesionService()

    init(paciente: Paciente) {
        self.paciente = paciente
    }

    var ultimoPeso: Double? {
        metrics.obtenerPesoActual(sesiones: paciente.sesiones)
    }

    var sesionesOrdenadas: [Sesion] {
        sesionService.sesionesOrdenadas(paciente.sesiones)
    }

    func eliminarSesion(context: ModelContext, sesion: Sesion) {
        context.delete(sesion)
        try? context.save()
    }
}
