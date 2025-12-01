//
//  MetricsService.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct MetricsService {

    func calcularIMC(peso: Double, estaturaCm: Double) -> Double {
        let estaturaM = estaturaCm / 100
        guard estaturaM > 0 else { return 0 }
        return peso / (estaturaM * estaturaM)
    }

    func diferenciaDePeso(sesiones: [Sesion]) -> Double? {
        let ordenadas = sesiones.sorted { $0.fecha < $1.fecha }
        guard let primero = ordenadas.first?.peso,
              let ultimo = ordenadas.last?.peso else { return nil }
        return ultimo - primero
    }

    func obtenerPesoActual(sesiones: [Sesion]) -> Double? {
        sesiones.sorted { $0.fecha > $1.fecha }.first?.peso
    }
}
