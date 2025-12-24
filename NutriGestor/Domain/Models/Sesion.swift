//
//  Sesion.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftData
import Foundation

@Model
final class Sesion {

    @Attribute(.unique) var id: UUID
    var fecha: Date
    var peso: Double
    // Métricas corporales y composición
    var imc: Double?
    var grasaCorporalPorcentaje: Double?
    var musculoEsqueleticoPorcentaje: Double?
    var cinturaCm: Double?
    var caderaCm: Double?
    var pechoCm: Double?
    var brazoCm: Double?
    var piernaCm: Double?
    var notas: String?
    @Relationship var paciente: Paciente?

    init(
        fecha: Date = .now,
        peso: Double,
        imc: Double? = nil,
        grasaCorporalPorcentaje: Double? = nil,
        musculoEsqueleticoPorcentaje: Double? = nil,
        cinturaCm: Double? = nil,
        caderaCm: Double? = nil,
        pechoCm: Double? = nil,
        brazoCm: Double? = nil,
        piernaCm: Double? = nil,
        notas: String? = nil,
        paciente: Paciente? = nil
    ) {
        self.id = UUID()
        self.fecha = fecha
        self.peso = peso
        self.imc = imc
        self.grasaCorporalPorcentaje = grasaCorporalPorcentaje
        self.musculoEsqueleticoPorcentaje = musculoEsqueleticoPorcentaje
        self.cinturaCm = cinturaCm
        self.caderaCm = caderaCm
        self.pechoCm = pechoCm
        self.brazoCm = brazoCm
        self.piernaCm = piernaCm
        self.notas = notas
        self.paciente = paciente
    }
    
    // Compatibilidad con llamadas previas
    convenience init(
        fecha: Date = .now,
        peso: Double,
        notas: String? = nil,
        paciente: Paciente? = nil
    ) {
        self.init(
            fecha: fecha,
            peso: peso,
            imc: nil,
            grasaCorporalPorcentaje: nil,
            musculoEsqueleticoPorcentaje: nil,
            cinturaCm: nil,
            caderaCm: nil,
            pechoCm: nil,
            brazoCm: nil,
            piernaCm: nil,
            notas: notas,
            paciente: paciente
        )
    }
}
