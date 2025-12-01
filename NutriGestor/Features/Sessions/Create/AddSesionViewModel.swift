//
//  AddSesionViewModel.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation
import SwiftData
import Observation

@Observable
final class AddSesionViewModel {

    var fecha: Date = .now
    var pesoTexto: String = ""
    var notas: String = ""

    private let sesionService = SesionService()
    private let validator = SesionValidator.self

    var esValido: Bool {
        guard let peso = Double(pesoTexto) else { return false }
        return validator.validarPeso(peso) && validator.validarFecha(fecha)
    }

    func crearSesion(context: ModelContext, paciente: Paciente) {
        guard let peso = Double(pesoTexto) else { return }

        let nuevaSesion = sesionService.crearSesion(
            fecha: fecha,
            peso: peso,
            notas: notas,
            paciente: paciente
        )

        context.insert(nuevaSesion)
        try? context.save()
    }
}
