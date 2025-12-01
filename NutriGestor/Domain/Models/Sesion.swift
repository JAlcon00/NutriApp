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
    var notas: String?
    @Relationship var paciente: Paciente?

    init(
        fecha: Date = .now,
        peso: Double,
        notas: String? = nil,
        paciente: Paciente? = nil
    ) {
        self.id = UUID()
        self.fecha = fecha
        self.peso = peso
        self.notas = notas
        self.paciente = paciente
    }
}
