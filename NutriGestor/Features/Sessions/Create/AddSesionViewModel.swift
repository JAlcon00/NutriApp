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
    // Composición corporal y medidas (como texto para entrada)
    var grasaPorcentajeTexto: String = ""
    var musculoPorcentajeTexto: String = ""

    var cinturaTexto: String = ""
    var caderaTexto: String = ""
    var pechoTexto: String = ""
    var brazoTexto: String = ""
    var piernaTexto: String = ""

    var notas: String = ""

    private let sesionService = SesionService()
    private let validator = SesionValidator.self
    private let metrics = MetricsService()

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

        // Calcular IMC con base en el peso y la estatura del paciente
        let imcCalculado = metrics.calcularIMC(peso: peso, estaturaCm: paciente.estaturaCm)
        nuevaSesion.imc = imcCalculado

        // Helpers para parsear decimales con coma o punto
        func parse(_ text: String) -> Double? {
            let cleaned = text.replacingOccurrences(of: ",", with: ".").trimmingCharacters(in: .whitespacesAndNewlines)
            return Double(cleaned)
        }

        nuevaSesion.grasaCorporalPorcentaje = parse(grasaPorcentajeTexto)
        nuevaSesion.musculoEsqueleticoPorcentaje = parse(musculoPorcentajeTexto)
        nuevaSesion.cinturaCm = parse(cinturaTexto)
        nuevaSesion.caderaCm = parse(caderaTexto)
        nuevaSesion.pechoCm = parse(pechoTexto)
        nuevaSesion.brazoCm = parse(brazoTexto)
        nuevaSesion.piernaCm = parse(piernaTexto)

        context.insert(nuevaSesion)
        try? context.save()
    }
}
