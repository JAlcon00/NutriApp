//
//  SesionValidator.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct SesionValidator {

    static func validarPeso(_ peso: Double) -> Bool {
        peso > 0
    }

    static func validarFecha(_ fecha: Date) -> Bool {
        fecha <= .now
    }

    static func validarNotas(_ notas: String?) -> Bool {
        true
    }
}
