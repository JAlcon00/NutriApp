//
//  Paciente.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//
import SwiftData
import Foundation

@Model
final class Paciente {

    @Attribute(.unique) var id: UUID
    var nombre: String
    var apellido: String
    var email: String?
    var telefono: String?
    var estaturaCm: Double
    var notas: String?
    @Relationship(deleteRule: .cascade) var sesiones: [Sesion]

    init(
        nombre: String,
        apellido: String,
        email: String? = nil,
        telefono: String? = nil,
        estaturaCm: Double,
        notas: String? = nil
    ) {
        self.id = UUID()
        self.nombre = nombre
        self.apellido = apellido
        self.email = email
        self.telefono = telefono
        self.estaturaCm = estaturaCm
        self.notas = notas
        self.sesiones = []
    }
}

